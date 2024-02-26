---
title: Upgrade Ghost blog to 0.11.0 on Openshift platform
date: "2016-09-30T23:24:00"
type: post
slug: upgrade-ghost-blog-to-0-11-0-on-openshift-platform
cover: /images/featured/ghost11-openshift.png
category: ["Blogging", "Web development"]
tags: ["ghost", "blog", "openshift"]
author: jmtalarn
---

I installed Ghost as my blogging platform some time ago and I have been updating it for each Ghost update. All this is running and hosted by the [RedHat OpenShift platform](https://www.openshift.com/web-hosting/).

<!--more-->

You can check how I've a Node.js Express App alive together with my blog in this post [Express app and a Ghost blog together](http://blog.jmtalarn.com/express-app-and-a-ghost-blog-together/ "Express app and a Ghost blog together").

<h2 id="ampavailableforghostblogposts">AMP available for Ghost blog posts</h2>

With the latest version available I noticed a very interesting feature for me: the automatic render of [Accelerated Mobile Pages (AMP)](http://blog.jmtalarn.com/how-to-build-an-accelerated-mobile-page-amp/) version of the blog posts, speeding up the load times on mobile devices. **And all this, looking handsome and sexy to Google's eyes!**

Basically you need to add an _amp.hbs_ template to your theme and follow the rules and recommendations to [build AMP pages](http://blog.jmtalarn.com/how-to-build-an-accelerated-mobile-page-amp/).

Here is full information about AMP support for your Ghost themes [http://themes.ghost.org/v0.10.0/docs/amp](http://themes.ghost.org/v0.10.0/docs/amp)

<h2 id="updatingghostonopenshift">Updating Ghost on Openshift</h2>

In order to update you should modify your package.json file in your project to use the new version of Ghost NPM module (^0.11.0).

You also should modify the node value in engines section to use the newest compatible node version and recommended by Ghost team (~4.2).

```json
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
		"node": "~4.2.0"
	},
	"engineStrict": true,
	"dependencies": {
		"express": "^4.13.3",
		"ghost": "^0.11.0"
	}
}
```

<h2 id="enospcerrorwhenupgrading">ENOSPC error when upgrading</h2>

Maybe if you are on the free gears layer you'll must clean and tidy your space to prevent a _Not Enough Space error_, also known as **ENOSPC error**.

You should run the command using the openshift command line client rhc.

```bash
rhc app tidy ghost
```

You can also run with dependencies errors. You should connect via ssh to your app host

```bash
rhc ssh app YOURAPP
```

And remove node_modules folder, clean the node packages cache and reinstall the packages:

```bash
rm -rf node\_modules && npm cache clear && npm install --production.
```

You can check the latest Ghost blog version updates on its blog [https://dev.ghost.org/ghost-0-11-0/](https://dev.ghost.org/ghost-0-11-0/)
