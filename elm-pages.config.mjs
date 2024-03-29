import { defineConfig } from "vite";
//import adapter from "elm-pages/adapter/netlify.js";
import adapter from "./adapter.mjs"



export default {
  vite: defineConfig({}),
  adapter,
  headTagsTemplate(context) {
    const basePath = process.env.BASE_PATH;
    console.log({ context, basePath })
    return `
<link rel="stylesheet" href="/style.css" />
<meta name="generator" content="elm-pages v${context.cliVersion}" />
<base href="./${basePath}" />
`;
  },
  preloadTagForFile(file) {
    // add preload directives for JS assets and font assets, etc., skip for CSS files
    // this function will be called with each file that is procesed by Vite, including any files in your headTagsTemplate in your config
    return !file.endsWith(".css");
  },
};



