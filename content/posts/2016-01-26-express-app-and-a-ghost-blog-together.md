---
title: Express app and a Ghost blog together
date: 2016-01-26T04:35:12
type: post
slug: express-app-and-a-ghost-blog-together
category: ['Blogging', 'Web development']
tags: ['express', 'nodejs', 'ghost']
cover: /images/featured/nodejsexpressghost.jpg
author: jmtalarn
---

If you know anything about Ghost development surely you know <em>Ghost</em> is based with the <em>Express</em> framework over the <em>Node.js</em> server.

Well, maybe someday you want to add an extra superpower to your blog taking advantage of your javascript development skills over <em>Node.js</em>.

You can put it all together and play with all this stuff.

<!--more-->

<h2 id="letsseehow">Let's see how.</h2>
<p><em>Ghost</em> is available as <em>Node</em> module in the <em>Npm</em> repository and the solution is as easy as install the needed modules.</p>
<p>You can see in the dependencies section how the two required packaged were added in the descriptive package.json file.</p>

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

<p>Here we decided to use an explicit version of the <em>Express</em> module instead the used inside the <em>Ghost</em> module but nothing forbids you to import any module already included in the <em>Ghost</em> project, or any other module, inside your code with a line like</p>

```javascript
var that = require('./node_modules/MyModule/node_modules/AnotherModule')
```

<h2 id="andherecomesthemagic">And here comes the magic!</h2>
<p>In order to run only a server including the Ghost and your own module. In the script file that runs the app in our case, you should force your app to use and share the same process that starts the blog engine:</p>
<p>This is the index.js</p>

```javascript
var path = require('path')
var ghost = require('ghost')

var express = require('express')
var app = express()

var routes = express.Router()

routes.get('/', function(req, res, next) {
  // res.render('index', { title: 'Express' });
  res.json({
    message: 'Hello world! ',
  })
})

app.use('/api', routes)

ghost({
  config: path.join(__dirname, 'config.js'),
}).then(function(ghostServer) {
  // ghostServer.start();
  app.use(ghostServer.config.paths.subdir, ghostServer.rootApp)
  ghostServer.start(app)
})
```

<blockquote><p>That's the trick! 💡</p></blockquote>
