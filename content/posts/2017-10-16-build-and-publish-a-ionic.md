---
title: Build and publish a Ionic App
date: "2017-10-16T05:45:53"
type: post
slug: build-publish-ionic-app
cover: /images/featured/build-publish-ionic-app.png
category: ["App development", "Web development"]
tags:
    [
        "android",
        "angularjs",
        "app",
        "firebase",
        "google",
        "html",
        "ionic",
        "nodejs",
        "play store",
        "productivity",
        "strikethru",
    ]
author: jmtalarn
---

# Build and publish a Ionic application

These are the posts about how I implemented a Ionic framework application (v1).

<!--more-->

Here it is the Github repository [https://github.com/jmtalarn/strikethru](https://github.com/jmtalarn/strikethru)

## [The idea](/build-publish-ionic-app-i-idea)

[The idea](https://blog.jmtalarn.com/build-publish-ionic-app-i-idea)

Any project starts with an idea. In this case, with the target of learning about [Ionic framework](https://ionicframework.com/), I decided to use the idea from the [Strikethru](https://www.striketh.ru/) productivity method, a kind of improved [GTD](https://es.wikipedia.org/wiki/Getting_Things_Done), which in its analogical version it worked for me.

## [Configuring Firebase](/build-publish-ionic-app-configuring-firebase)

[Configuring Firebase](https://blog.jmtalarn.com/build-publish-ionic-app-configuring-firebase)

Any application with needs to be some kind of online logic needs a counterpart in the [backend](https://en.wikipedia.org/wiki/Front_and_back_ends). [Firebase](https://firebase.google.com/) offers you some kind of backend capabilities as [NoSQL](https://en.wikipedia.org/wiki/NoSQL) database, a useful simple data store or the backend managament for integrating authentication with some of the most common website accounts like Google, Github, Facebook... Everything with a ready to use interface to manage directly that data and configurations.

## [First steps](/build-publish-ionic-app-first-steps)

[First steps](https://blog.jmtalarn.com/build-publish-ionic-app-first-steps)

In this post there is a little guide with all the tools you need to install [Node.js](https://nodejs.org/en/), [Bower](https://bower.io/) or the own Ionic Framework [CLI](https://en.wikipedia.org/wiki/Command-line_interface) and the few commands you need to create an initial application with a scaffold of the project structure.

## [AngularJs views and routes](/build-publish-ionic-app-views-routes)

[AngularJs views and routes](https://blog.jmtalarn.com/build-publish-ionic-app-views-routes)

A Ionic application is nothing else than a AngularJS application running inside a [Webviewer](https://developer.telerik.com/featured/what-is-a-webview/) in the device. Each application needs to define its views and in any web application each view corresponds, usually, into a web route. Here there is the relation of views created in the application.

## [Defining services and controllers](/build-publish-ionic-app-angular-structure-services-controllers)

[Defining services and controllers](https://blog.jmtalarn.com/build-publish-ionic-app-angular-structure-services-controllers)

AngularJS needs code to work :D. It is interesting to put that code in a place or another depending on the scope of the functionality for the good of the project maintenance and for future developers. The services or factories have the mission of providers whilst the controllers have the mission to contain the business logic of the application components.

## [Defining directives](/build-publish-ionic-app-angular-structure-directives)

[Defining directives](https://blog.jmtalarn.com/build-publish-ionic-app-angular-structure-directives)

Reusing code is something that you always want to do... Creating directives allows you to create components that can be reused in many places on your app and even export externally to be used in other apps.

## [Adding Cordova plugins](/build-publish-ionic-app-cordova-plugins)

[Adding Cordova plugins](https://blog.jmtalarn.com/build-publish-ionic-app-cordova-plugins)

Ionic framework is built on top of [Apache Cordova](https://cordova.apache.org/). This framework integrates the native API of the devices to the application developed and let's add some plugins with many additional integrations. In this post there is a list of the plugins used in the application.

## [Sync data with Firebase](/build-publish-ionic-app-live-update-firebase-angularjs)

[Sync data with Firebase](https://blog.jmtalarn.com/build-publish-ionic-app-live-update-firebase-angularjs)

The application saved on save buttons so, while you are writing and moving tasks around it is updating automatically the backend provided with Firebase. This is the procedure implemented.

## [Create icon and splash images](/build-publish-ionic-app-icon-splash-images)

[Create icon and splash images](https://blog.jmtalarn.com/build-publish-ionic-app-icon-splash-images)

It's not only a marketing question. Mainly the icon and second the splash image is the presentation of your application and in many case the first impression counts... a lot.

## [Build the final application package and publish to the market](http://ionicframework.com/docs/v1/guide/publishing.html)

[Publishing it!](http://ionicframework.com/docs/v1/guide/publishing.html)

Pending of the publication on my own of the application in the app store here there is this final post, original from the ionic framework documentation. It guides you in the task of build, sign and publish your application in the Google Play store application market or the iOs App Store.
