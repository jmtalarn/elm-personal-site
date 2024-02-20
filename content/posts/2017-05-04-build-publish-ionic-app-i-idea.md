---
title: Build and publish a Ionic App - The idea
date: 2017-05-04T12:38:34
type: post
slug: build-publish-ionic-app-i-idea
cover: /images/featured/ux-787980_1920.jpg
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

I created an app and I will write a series of posts about it with some issues, difficulties and caveats I found during the development.

You can find the source code in Github <a href="https://github.com/jmtalarn/strikethru" target="\_blank">https://github.com/jmtalarn/strikethru</a>

<!--more-->

<h2>The idea</h2>
I tried many times to find an original and breaking idea to implement an app... But my creativity is so limited and I'm not so good creating new things. Then I decided to implement a version of something existing and I thought with a productivity system since a time ago I am using.

I tried some systems before without success but <a href="http://striketh.ru/">Strikethru </a>simply worked for me.

<img src="../images/2017-04-27-09_59_06-Strikethru.png" alt="Strikethru, a new way to get more done" width="786" height="329" />

<iframe src="https://www.youtube.com/embed/T4M8JfArx6I?rel=0" width="560" height="315" frameborder="0" allowfullscreen="allowfullscreen"></iframe>

**Yet another todo tasks list application. **The idea for the app is, against the original idea, to replace the analog paper notebook and the pen. Simple and useful.

<h2 id="technology"> The technology</h2>

I decided to choose to develop it using <a href="https://ionicframework.com/">Ionic Framework v1</a> and <a href="https://firebase.google.com/">Firebase</a>.

<figure><img src="../images/1200px-Ionic_Logo.svg.png" style="height: 5rem; width:auto" alt="The Ionic Framework v1 helps you to create hybrid mobile apps" /> <figcaption>Ionic Framework: The top open source framework for building amazing mobile apps.</figcaption></figure>

I know it isn't the newest framework and there are newer versions of the framework.  But I have experience using the Angular framework (1.x) in web development and I decided choose this one because I want to be able to deploy an Android app using my current web development knowledge. The learning curve with Ionic Framework it's a straight forward step if you already know something about Angular 1.x

I'm not the only one not yet introduced to Angular 2 framework and if it has been working until now maybe it's because it is good solution for creating hybrid applications.

<figure><img src="../images/image00.png" style="height: 5rem; width:auto" alt="Firebase provide a great entry level infrastructure to provide a greatful backend to your apps."/>
<figcaption> Firebase: The tools and infrastructure you need to build better apps and grow successful businesses.</figcaption></figure>

Firebase provides a datastore for json data, allows off line disconections during the execution of the applications, integrates social author with Google and other providers and also helps you to integrate ads so I could monetize the app once it is published on the Play Store.

I discovered the Firebase Platform during the free React course of <a href="http://carlosazaustre.es/blog">Carlos Azaustre</a>. In the following Youtube video you can see a presentation of the Firebase platform integrated with an Angular development and you can get an overview of the platform. The company was acquired by Google in October 2014.

<blockquote class="twitter-tweet" data-lang="ca">
<p dir="ltr" lang="en" style="text-align: center;">Build an <a href="https://twitter.com/hashtag/app?src=hash">#app</a> with <a href="https://twitter.com/angular">@angular</a> and <a href="https://twitter.com/Firebase">@Firebase</a> <a href="https://t.co/JXPq7jKafq">https://t.co/JXPq7jKafq</a>

🔒Authentication
💾Datastore and Nonrel db
✈Intermitent offline<a href="https://twitter.com/hashtag/angularjs?src=hash">#angularjs</a>

<p style="text-align: center;">— JMTE (@jmtalarn) <a href="https://twitter.com/jmtalarn/status/847149153000050688">29 de març de 2017</a>

</blockquote>

For the moment I limited the target app to the Google Play store due the access barrier is only for 25 € instead of the 100 € /yearly of the Apple App store.

But, just in case, you never know, the Ionic Framework provides you everything you need to quickly release the App onto the iOS with only a command line from an Apple development computer.
