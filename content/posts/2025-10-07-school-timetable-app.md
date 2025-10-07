---
title: "Building Horari: a tiny, offline-first school timetable you can share"
date: "2025-10-07T10:26:45"
type: post
slug: school-timetable-app
cover: /images/featured/school-timetable.png
category: ["Web development", "App development"]
tags: ["web", "typescript", "react", "vite", "local-first", "pwa"]
author: jmtalarn
---

Weekday mornings are chaotic. Different start times, after-school activities, one kid finishes early on Wednesdays, another has music on Fridays… and the paper timetable on the fridge never reflects reality for long.

We wanted something:

-   **Fast** and **offline-first** — works on a phone without an account or network.
-   **Kid-centric** — plan per kid, not per class; color-code “matters” (subjects/activities).
-   **Touch-friendly** — drag and resize blocks the way your brain thinks: up/down on a vertical grid.
-   **Shareable when needed** — send a link to a caregiver; they open and import, done.
-   **Respectful of privacy** — everything stays on your device unless you explicitly share.

That became **Horari** (Catalan for “timetable”): a small PWA you can install, use offline, and share on your terms.

## <!--more-->

> A practical story about why we built it, how it helps busy families, and the tech behind the scenes (React, dnd-kit, CSS Modules, Netlify Functions v2 + Blobs, and a sprinkle of i18n).

## What the app does (at a glance)

-   **Create kids & matters** (subjects/activities with optional colors).
-   **Plan the week** with a vertical, 5-minute-granularity grid:

    -   Drag blocks with a **dedicated handle** (prevents accidental drags).
    -   Resize from **top or bottom**; the **overlay pins** the correct edge.
    -   **Time badges** show start/end while moving or resizing.
    -   Mobile-first hit areas and **pointer/touch sensors**.

-   **Settings** with simple tabs (Kids, Matters, Scheduler, Help).
-   **Installable PWA** and **offline** by default; data lives locally.
-   **Export/Import**:

    -   Click **Share/Export** to generate a link.
    -   We store the bundle server-side in **Netlify Blobs** and share only a short **ID** in the URL.
    -   The receiver opens the link, reviews kids and options, then imports.

---

## Architecture & tech choices

### Tooling: Vite

We picked **Vite** for its zero-friction DX and production-ready output:

-   **Instant dev server & HMR** — edits reflect in milliseconds, which matters when tuning micro-interactions like drag/resize.
-   **TypeScript, JSX, CSS Modules out of the box** — no boilerplate; just import and go.
-   **Lean config, powerful build** — ESBuild powers dev transforms; **Rollup** powers production with tree-shaking, code-splitting, and preloading.
-   **Simple env & PWA story** — `import.meta.env` for config; easy to layer in i18n and PWA plugins if needed.
-   **Netlify-friendly** — static assets to `dist/`, and our serverless endpoint lives at `/.netlify/functions/bundles` (exposed as `/bundles` via a redirect). In dev, `netlify dev` runs Vite and Functions together with no extra setup.

> Local dev tip: either run `netlify dev` (recommended), or proxy the functions path from Vite if you run the function server separately.

```typescript
// vite.config.ts (optional proxy if not using `netlify dev`)
import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

export default defineConfig({
	plugins: [react()],
	server: {
		proxy: {
			// our function is exposed as /bundles in production via a redirect
			"/bundles": "http://localhost:8888/.netlify/functions/bundles",
			"/.netlify/functions": "http://localhost:8888",
		},
	},
});
```

### Frontend stack

-   **[React](https://react.dev/) + [TypeScript](https://www.typescriptlang.org/)** — predictable data shapes, nice DX.
-   **[CSS Modules](https://github.com/css-modules/css-modules)** — tight, component-scoped styles; easy theming with green accents.
-   **[dnd-kit](https://docs.dndkit.com/)** — modern drag-and-drop with fine-grained control:

    -   `PointerSensor` + `TouchSensor` with small activation delays/tolerances to prevent accidental drags.
    -   **Resize** implemented by making the top/bottom pills **draggable handles**.
    -   **Movement modifier** to lock horizontal motion during resize.
    -   **Overlay alignment**: we measure the block and handle rects at drag-start and apply an X offset so the “ghost” aligns perfectly with the block across devices.

-   **[react-intl](https://formatjs.github.io/docs/react-intl/)** — localization (English, Spanish, Catalan).

### Data model (lightweight by design)

```typescript
type Kid = { id: string; name: string };
type Matter = {
	id: string;
	name: string;
	color?: string;
	startDate?: string;
	endDate?: string;
};
type TimeBlock = { id: string; matterId: string; start: string; end: string };
type Weekday = "mon" | "tue" | "wed" | "thu" | "fri" | "sat" | "sun";

type Timetable = {
	kidId: string;
	days: Record<Weekday, TimeBlock[]>;
};

type AppConfig = {
	startHour: string; // '08:00'
	endHour: string; // '18:00'
	startOfWeek: "mon" | "sun";
	hiddenWeekdays?: Weekday[];
};
```

Locally we persist everything in a tiny DB wrapper (Local Storage/IndexedDB), read/write via `readDB()` / `writeDB()`. No account, no sync.

### Interactions that feel right on touch

-   **Dedicated drag handle** inside the block; the block body itself isn’t draggable. This reduces accidental drags while scrolling.
-   **Resizable pills** at the **top** and **bottom**:

    -   During resize, we **lock horizontal movement**.
    -   The overlay is **pinned** to the correct edge:

        -   Resize from bottom → top edge stays put.
        -   Resize from top → bottom edge stays put.

-   **Time badges** on the **left** while resizing or moving — instant feedback.

### Import & export that survives messaging apps

Long URLs get truncated in messaging apps. We moved to **Netlify Functions v2 + Blobs**:

-   **POST** `/bundles` with the JSON bundle → returns a short **`id`**.
-   Build a share URL like: `https://your.app/import?id=<id>`.
-   On the import page we **GET** `/bundles?id=<id>` to fetch the bundle.

Only the **ID** travels in the link; the actual data lives in a private Blob store attached to your site.

**Privacy defaults**

-   Your app still keeps all working data **only on the device**.
-   We upload to Blobs **only when you press Share**, and only the chosen kids/subjects/timetables plus (optionally) hour config.
-   Blobs are **not public**; access goes through your Netlify Function and CORS origin guard.

### [Netlify Functions v2](https://www.netlify.com/blog/introducing-netlify-functions-2-0/) + [Blobs](https://docs.netlify.com/build/data-and-storage/netlify-blobs/) (tiny backend)

We implemented the tiny backend as a single **Netlify Function v2** endpoint. The v2 runtime uses the standard **Request/Response Web APIs** and native ESM, which makes server code feel like writing browser code—`export default async function handler(request)` and return a `new Response(...)`. That uniformity keeps things simple: no framework lock-in, no custom event objects to learn, and it’s easy to add **CORS**, parse JSON, and branch on HTTP methods (GET/POST) in a few lines. Deploys ride along with the site build, so the function version always matches the front-end code that calls it.

### Durable share links with Netlify Blobs

For storing shared timetables we use **Netlify Blobs**, a lightweight, key/value‐style storage that works directly from Functions and Edge Functions. We create (or reference) a **store**, write JSON bundles under a namespaced key, and return a short **ID** in the share URL. On import, the app hits the endpoint with `?id=...` and reads the JSON back. There’s no database to run, no schema migrations, and no auth server to maintain—perfect for “drop a payload, fetch it once or a few times” scenarios like share links.

### Why Functions v2 + Blobs fit a PWA

This app is primarily offline-first and client-side. We only need a tiny server touch to move data between two browsers. **Functions v2** gives us a minimal, fast cold-start API surface; **Blobs** gives us durable storage with one line (`getStore(...).set(...)`). Together they keep the back end almost invisible: a single endpoint, a few dozen lines of code, and we’re done. It’s also cost-friendly and scales with traffic automatically.

### Notes on security & lifecycle

We generate opaque, unguessable IDs (timestamp + UUID) and never expose raw data in the URL, which avoids copy/paste truncation issues and keeps payloads off the address bar. If a link should be temporary, you can enforce **time-based cleanup** from a scheduled function (e.g., daily job that deletes blobs older than N days) or write a simple “one-time read” rule in your handler. Add CORS headers to the function response to restrict which origins can fetch bundles in production.

The function is a single file `netlify/functions/bundles.ts`:

-   **POST** — validate payload, write to Blobs with a generated ID; return `{ id }`.
-   **GET** — read JSON by ID and return it.
-   CORS preflight and origin allow-list.

```typescript
// netlify/functions/bundles.ts
import { getStore } from "@netlify/blobs";

const STORE_NAME = process.env.BUNDLES_STORE || "site";
const KEY_PREFIX = "bundles/";
const ALLOW_ORIGIN = process.env.APP_ORIGIN || "*";

const baseHeaders = {
	"Access-Control-Allow-Origin": ALLOW_ORIGIN,
	"Access-Control-Allow-Methods": "GET,POST,OPTIONS",
	"Access-Control-Allow-Headers": "Content-Type",
};

export default async function handler(request: Request): Promise<Response> {
	if (request.method === "OPTIONS")
		return new Response("", { status: 204, headers: baseHeaders });
	const store = getStore(STORE_NAME);

	if (request.method === "POST") {
		const body = await request.json().catch(() => null);
		const bundle = body?.bundle ?? body;
		if (!bundle) return json(400, { error: "Invalid bundle payload" });
		const id = makeId();
		await store.set(KEY_PREFIX + id, JSON.stringify(bundle), {
			contentType: "application/json",
		});
		return json(200, { id });
	}

	if (request.method === "GET") {
		const url = new URL(request.url);
		const id = url.searchParams.get("id");
		if (!id) return json(400, { error: "Missing ?id" });
		const bundle = await store.get(KEY_PREFIX + id, { type: "json" });
		if (!bundle) return json(404, { error: "Not found" });
		return json(200, bundle);
	}

	return json(405, { error: "Method Not Allowed" });

	function json(status: number, data: unknown) {
		return new Response(JSON.stringify(data), {
			status,
			headers: { "Content-Type": "application/json", ...baseHeaders },
		});
	}
	function makeId() {
		const uuid =
			(globalThis.crypto as any)?.randomUUID?.() ??
			Math.random().toString(36).slice(2, 10);
		return `${Date.now().toString(36)}-${uuid}`;
	}
}
```

On the client, `shareBundleForKids(selectedIds)` builds the export bundle, `POST`s to `/bundles`, gets an `id`, and opens the native share sheet with a short import URL. `ImportGate` reads `?id=…`, fetches the bundle, lets you pick which kids to import, and applies **merge rules**:

-   **Matters**: match by **name**, widen date ranges if needed.
-   **Kids**: match by **name**, reuse or create IDs.
-   **Timetables**: replace per kid.
-   **Config**: optionally widen scheduler hours (earlier start/later end).

### Routing & direct links

Because this is an SPA, we add a catch-all redirect so `/week`, `/import`, or any deep link loads the app shell first:

```toml
# netlify.toml
[[redirects]]
  from = "/*"
  to = "/index.html"
  status = 200
```

That fixes “refresh on deep link shows 404” problems and ensures import links work from a cold start.

---

## Lessons learned

Building a small, offline-first PWA with a “just enough” backend surfaced a bunch of practical lessons that might save you time on your own project.

### 1) Design for _selection → edit_ on touch

We discovered that hiding drag/resize controls until a block is selected avoids accidental drags on mobile. Hover hints are fine on desktop, but on touch we needed a clear tap-to-select state before showing full-opacity handles.  
**Next time:** treat touch and pointer as different UX modes from day one and gate edit affordances behind an explicit “selected” state.

### 2) “Ghosts” vs live resize — pick one early

We started with a drag overlay (“ghost”) and ended up aligning it pixel-perfect to the block during resize (pin top on bottom-drag, pin bottom on top-drag). That made intent obvious and removed jitter. In many cases, simply resizing the _actual_ block live (with optimistic constraints) is even clearer and simpler to implement.  
**Next time:** begin with live resize, fall back to an overlay only if layout constraints or collisions demand it.

### 3) dnd-kit tips that mattered

-   **Lock the axis** during resize with a modifier to prevent horizontal drift on narrow handles.
-   **Measure and offset** the overlay X from the real block when the pointer starts on a small handle.
-   **Use a dedicated drag handle** for moving; don’t make the whole block draggable on mobile—fat-finger drags are real.
-   **Snap math** in minutes → rows → pixels should be centralized so move and resize share identical rules.

### 4) Time semantics > time strings

All scheduling math lives in minutes since day start, with a single source of truth for step size, snap, clamp, and min durations. The view layer converts back to `HH:mm` for labels.  
**Next time:** keep time math unit-tested in a tiny module before any UI exists.

### 5) Internationalization from the start

We carried UI strings through `react-intl`, but also learned to:

-   Keep messages short and neutral so they adapt to Spanish/Catalan.
-   Avoid concatenated sentences; prefer ICU placeholders (e.g., `{incomingHoursText}`).
-   Localize _time formats_ too, not just labels.  
    **Next time:** run a quick pseudo-loc build early to catch layout overflow.

### 6) Share links > payload URLs. Why base64-in-URL failed on mobile.

We started with “all client, no backend”: serialize the bundle to JSON → compress (pako/deflate) → base64url → stick it in the URL hash (`/#data=…`). It worked great on desktop and even across most browsers. Then the real world (mobile + messaging apps + clipboards) happened.

**What we saw**

-   Some users pasted a share link into WhatsApp/SMS and the receiver’s app crashed the import with `atob: The string to be decoded is not correctly encoded`.
-   Others copied the link from the app to the system clipboard, switched apps, pasted—and the last part of the URL was missing.
-   Occasionally, pasted links contained stray spaces or line breaks inside the data payload.

**Why it happened (layer by layer)**

1. **Payload expansion tax.**  
   JSON → deflate → base64 still _grows_ in some cases. Base64 adds ~33% overhead; URL encoding may add more. A modest 20 KB JSON can easily become 28–40 KB of URL data. Long timetable sets balloon quickly.

2. **App-specific limits & behaviors.**

    - **Messaging apps** often inject soft line breaks around 4–8k characters, or reflow very long strings. Some auto-linkers clip long URLs so previews unfurl.
    - **Mobile clipboards** on certain keyboards/OS versions truncate long strings; others preserve but insert whitespace.
    - **Auto-formatting** can replace `+` with spaces, or normalize Unicode, which corrupts base64 unless you’re using base64url and strict decoding.

3. **Hash vs query string doesn’t save you.**  
   We used `#data=…` so servers never saw the payload (privacy win). But link unfurlers, messaging wrappers, and copy/paste paths treat the visible URL the same. If they wrap, truncate, or sanitize, the fragment gets mangled just like a query.

4. **Error symptom is misleading.**  
   `atob` complaints aren’t about your encoder—they’re about a string that got _clipped or altered on the way_. Missing trailing characters or padding (`=`) is all it takes.

**What we tried (and why it didn’t fully help)**

-   **pako + base64url** (`-`/`_` instead of `+`/`/`): reduced sanitizer issues but not length.
-   **Stripping padding** (`=`): helped a little but didn’t prevent truncation.
-   **Shorter keys & minified JSON**: still long for multi-kid timetables.
-   **QR codes**: many scanners cap payload size or compress differently; still fragile.

**Numbers that guided the decision**

-   Real bundles landed between **8–60 KB** as JSON. After compression/base64, URLs routinely hit **12–80 KB**.
-   Multiple apps showed breakage above ~8–12 KB of URL text; some worked up to ~30 KB, others didn’t.

**The fix: server-side payload, client-side privacy**

-   We switched to a **tiny backend with Netlify Functions v2 + Blobs**:
    1. POST the bundle JSON → store as a blob → return a short random `id`.
    2. Share links look like `/import?id=abc123…` (tens of chars, reliable everywhere).
    3. On open, the app `GET`s the blob and imports locally.
-   The data remains **opaque** (unguessable ID). We added optional **expiry** via a scheduled cleanup.

**Mitigations we kept anyway**

-   **base64url discipline** wherever we still encode small bits.
-   **Client-side validation** with clear errors (“Link looks truncated or corrupted”).
-   **UI copy** explaining that imports fetch a shared bundle just once and nothing else is uploaded.

**Next time:** skip “data in the URL” for anything beyond a few kilobytes. Use a tiny store (Blobs, KV, or a pastebin-style endpoint) and share only a short, random ID.

### 7) Netlify Functions v2 + Blobs = tiny backend joy

-   **v2 Functions** feel like browser code—standard `Request/Response`, easy CORS, fast cold starts.
-   **Blobs** are perfect for one-shot JSON bundles without running a database.
-   Add a **store name** and a **prefix** for easy cleanup; return only an opaque **id** to the client.  
    **Next time:** add a scheduled cleanup function to enforce retention (e.g., delete blobs older than 30 days).

### 8) SPA routing bites—until you own 404

Direct-loading `/week` 404’d unless the root had been opened first. The fix was a Netlify SPA redirect so every unmatched path serves `index.html`.  
**Recipe:**

-   `_redirects`: `/* /index.html 200`
-   Or `[[redirects]]` in `netlify.toml`.  
    **Next time:** ship the redirect on day zero and add a small “boot guard” that rehydrates state before rendering routes.

### 9) Vite pays off in real life

Vite’s dev server + instant HMR made interaction work (drag/resize) iterate fast; its production build + code-splitting kept the PWA snappy, and the PWA plugin integrated cleanly.  
**Next time:** keep the build graph small—favor simple modules and defer heavy dependencies behind dynamic imports.

### 10) Data merge rules must be explicit

Our import logic merges matters **by name**, widens date ranges, and replaces each kid’s timetable. Subtle bugs come from ID reuse vs human names.  
**Next time:** document merge semantics in the UI (“What will happen?”) and unit-test a few tricky cases (renamed matters, overlapping ranges).

### 11) Accessibility is a feature, not a phase

-   Minimum 44×44px targets for handles on touch.
-   Keyboard focus styles on the drag handle and delete button.
-   ARIA labels for time badges and actions.  
    **Next time:** add keyboard move/resize (↑/↓ with snap) for power users and accessibility.

### 12) Performance hygiene for long days

With many blocks, simple wins mattered: CSS `will-change` on moving elements, translate transforms instead of layout thrash, and avoiding needless React state churn during `onDragMove`.  
**Next time:** throttle time label updates during drag and collapse re-renders with memoization.

### 13) Offline-first edge cases

The PWA works offline, but imports obviously need the function call. The UI now clearly states when a share link is being fetched and fails gracefully back to home.  
**Next time:** cache successful bundle fetches in IndexedDB in case a user backs out and returns without network.

### 14) Observability—even for tiny things

A few `console.info` calls aren’t enough. Add a light event log (share created, import started/succeeded/failed, blob read 404) to help support users and catch regressions.  
**Next time:** wire a privacy-respecting analytics event sink from the start (even a simple log endpoint).

---

## Roadmap

-   Conflict hints when blocks overlap.
-   “Templates” / recurring blocks.
-   Export to calendar.
-   Optional TTL & purge for shared bundles.
-   More languages and accessibility polish.

---

## Try it, install it, share it

Horari is small on purpose. Install it to your home screen, plan a week in 60 seconds, and share with one tap when needed — while keeping your family’s data on your devices by default.

<link-card url="https://horari-pwa.netlify.app/" image-position="top" style="width: 350px; margin: 0 auto;"></link-card>

<link-card url="https://github.com/jmtalarn/school-timetable" image-position="left"></link-card>
