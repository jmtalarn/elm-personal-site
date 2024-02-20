---
title: Express app and a Ghost blog together
date: 2016-01-26T04:35:12
type: post
slug: express-app-and-a-ghost-blog-together
category: ["Blogging", "Web development"]
tags: ["express", "nodejs", "ghost"]
cover: /images/featured/nodejsexpressghost.jpg
author: jmtalarn
---

If you know anything about Ghost development surely you know _Ghost_ is based with the _Express_ framework over the \*Node.js\* server.

Well, maybe someday you want to add an extra superpower to your blog taking advantage of your javascript development skills over \*Node.js\*.

You can put it all together and play with all this stuff.

<!--more-->

<h2 id="letsseehow">Let's see how.</h2>
*Ghost* is available as *Node* module in the *Npm* repository and the solution is as easy as install the needed modules.

You can see in the dependencies section how the two required packaged were added in the descriptive package.json file.

```javascript
{
  "name": "openshift-ghost-quickstart",
  "description": "Openshift Ghost Quickstart (SQLite)",
  "repository": {
    "type": "git",
    "url": "git://github.com/openshift-quickstart/openshift-ghost-quickstart.git"
  },
  "bugs": "https://github.com/openshift-quickstart/openshift-ghost-quickstart/issues",
  "main": "index.js",
  "scripts": {
    "start": "node index"
  },
  "engines": {
    "node": "~0.10.0"
  },
  "engineStrict": true,
  "dependencies": {
    "express": "^4.13.3",
    "ghost": "^0.7.0"
  }
}
```

Here we decided to use an explicit version of the _Express_ module instead the used inside the _Ghost_ module but nothing forbids you to import any module already included in the _Ghost_ project, or any other module, inside your code with a line like

```javascript
var that = require("./node_modules/MyModule/node_modules/AnotherModule");
```

<h2 id="andherecomesthemagic">And here comes the magic!</h2>
In order to run only a server including the Ghost and your own module. In the script file that runs the app in our case, you should force your app to use and share the same process that starts the blog engine:

This is the index.js

```javascript
var path = require("path");
var ghost = require("ghost");

var express = require("express");
var app = express();

var routes = express.Router();

routes.get("/", function (req, res, next) {
	// res.render('index', { title: 'Express' });
	res.json({
		message: "Hello world! ",
	});
});

app.use("/api", routes);

ghost({
	config: path.join(__dirname, "config.js"),
}).then(function (ghostServer) {
	// ghostServer.start();
	app.use(ghostServer.config.paths.subdir, ghostServer.rootApp);
	ghostServer.start(app);
});
```

<blockquote>That's the trick! 💡
</blockquote>
