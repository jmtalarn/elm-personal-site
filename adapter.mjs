import * as fs from "fs";


const endsWith = function (str, suffix) {
	return str.indexOf(suffix, str.length - suffix.length) !== -1;
};

export default async function run({
	renderFunctionFilePath,
	routePatterns,
	apiRoutePatterns,
}) {

	console.log("Running the adapter for 404 html page ");

	const notFoundPath = "dist/not-found/index.html";
	const _404Path = "dist/404.html";

	const html = fs.readFileSync(notFoundPath, "utf-8");

	// The tags look like this:
	// <script defer src="/elm.fcba9bad.js" type="text/javascript"></script>
	// <script type="module" crossorigin src="/assets/index-06bd4283.js"></script>
	const fixedHtml = html
		.replace(
			/<script defer src="\/elm\..{8}\.js" type="text\/javascript"><\/script>/,
			""
		)
		.replace(
			/<script type="module" crossorigin src="\/assets\/index-.{8}\.js"><\/script>/,
			""
		);

	fs.writeFileSync(_404Path, fixedHtml, "utf-8");

}

