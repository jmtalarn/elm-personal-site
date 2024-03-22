import * as fs from "fs";
import { Glob } from "glob";

export default async function run({
	renderFunctionFilePath,
	routePatterns,
	apiRoutePatterns,
}) {
	// console.log("Running adapter to fix links relative to path");
	// const projectPath = process.env.BASEPATH;
	// const g3 = new Glob('dist/**/*.html', { withFileTypes: true })

	// const wd = process.cwd();

	// g3.stream().on('data', path => {

	// 	if (path.fullpath().endsWith(".html")) {
	// 		console.log(path.fullpath());
	// 		const htmlFile = fs.readFileSync(path.fullpath(), "utf-8");
	// 		//console.log(htmlFile.replace(/href="\/(.*?)"/g, `href="./$1"`));
	// 		htmlFile.replace(/src="\/(.*?)"/g, `src="./$1"`);
	// 		fs.writeFileSync(path.fullpath(), htmlFile, "utf-8");
	// 	}
	// 	// console.log(
	// 	// 	'got a path object',
	// 	// 	path.fullpath(),
	// 	// 	path.isDirectory(),
	// 	// 	path.name,

	// 	// )
	// })

	// fs.readdirSync("dist", { recursive: true } ).forEach(file => {
	// 	if (file.endsWith(".html")) {
	// 		console.log(file);
	// 		const htmlFile = fs.readFileSync(file);
	// 		htmlFile.replace(/href="(.*)"/g, `href="${projectPath}$1"`);
	// 		htmlFile.replace(/src="(.*)"/g, `src="${projectPath}$1"`);
	// 		fs.writeFileSync(file, htmlFile, "utf-8");
	// 	}
	// })

	console.log("Running the adapter for 404 html page ");

	const notFoundPath = `dist/not-found/index.html`;
	const _404Path = `dist/404.html`;

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

function ensureDirSync(dirpath) {
	try {
		fs.mkdirSync(dirpath, { recursive: true });
	} catch (err) {
		if (err.code !== "EEXIST") throw err;
	}
}
