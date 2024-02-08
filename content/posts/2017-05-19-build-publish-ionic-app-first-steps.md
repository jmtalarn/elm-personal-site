---
title: Build and publish a Ionic App – First steps
date: 2017-05-19T23:10:03
type: post
slug: build-publish-ionic-app-first-steps
cover: /images/featured/blueprint-964630_1280.jpg
category: ['App development', 'Web development']
tags:
  [
    'android',
    'angularjs',
    'app',
    'firebase',
    'google',
    'html',
    'ionic',
    'nodejs',
    'play store',
    'productivity',
    'strikethru',
  ]
author: jmtalarn
---

These are the first steps, the initial commands and the index.html file you need to start developing your Ionic App with Firebase.
<!--more-->

<h2>Install Node.js, Apache Cordova and Ionic framework</h2>
<p>The first step will be install Node.js as Ionic provides a CLI that helps you to generate the app and provides some commands to build and generate the APK file and many other useful commands.</p>
<p>You should choose your development platform and Node.js version (Long Time Support or latest stable version) and follow the steps provided by the <a href="https://nodejs.org/en/">Node.js page.</a></p>
 <img class="" src="../images/2017-05-21-01_39_22-Node.js.png" alt="" />
<p>Once is installed, you proceed to install Ionic and Cordova as the Ionic Framework is built on the top of the Apache Cordova.</p>
<h3>Installing Apache Cordova</h3>
<p>
<img src="../images/cordova_bot.png" class="size-thumbnail" style="display: inline" alt="The Apache Cordova is a fundation part of the Ionic App" /> 
<a href="http://cordova.apache.org/">Apache Cordova</a> is a Mobile application development framework that provides access to some of the API usually accessible throw the specific development platform for Android, iOs and Windows Phone apps throw a Javascript SDK to write apps using HTML5, CSS3 and plain Javascript.</p>
<p>The following command will install the needed cordova executables globally, this is accessible for the whole system.</p>

```bash
sudo npm install -g cordova
```

<h3>Installing Ionic Framework CLI</h3>
<p>Ionic adds a layer over the Cordova framework providing an optimized version of the Angular framework, a set of visual components that will adapt to the specified target to follow the visual development guidelines  respectively and a Command Line Interface with own commands and as a wrapping of the <a href="https://bower.io/">Bower </a>and Cordova commands.</p>
<p>The next command will do the proper with the Ionic CLI to set it available throw all the system.</p>

```bash
sudo npm install -g ionic
```

<h2>Installing Bower to manage front-end dependencies</h2>
<p><img class="size-thumbnail" style="display: inline" src="../images/bower-logo.svg" /> We add Bower support to install front-end libraries as project dependencies. Ionic provides a configuration to save them into a specific folder in order to be included in the final geneated bundle. The following command will set it available also globally.</p>

```bash
sudo npm install -g bower
```

<h2 id="generating">Generating the Ionic app</h2>
<p>Once you have the Ionic CLI installed you can proceed to generate the application with just only one command:</p>

```bash
ionic start yourappname tabs --type ionic1
```

<p>The command details are:</p>
<ul>
<li><strong>start</strong> will generate a new app</li>
<li><strong>yourappname</strong> is the name you want to give to your app</li>
<li>the third parameter is the app <strong>template </strong>to generate a basic HTML code: <em>blank</em>,<em>tabs</em>,...<br />
blank will provide the HTML for a blank page and tabs provide the HTML skeleton for a tabbed application.<br />
In our app, we have chosen the tabbed template as it fits to the <a href="http://blog.jmtalarn.com/build-publish-ionic-app-i-idea/">starting idea of the app</a>.</li>
<li>The final parameter <strong>--type ionic1</strong> forces the generator to use the version 1 of the framework because of the <a href="http://blog.jmtalarn.com/build-publish-ionic-app-i-idea/#technology">technology chosen</a></li>
</ul>

<h2>Adding the mobile development platforms</h2>
<p>The following command will add support for the project for the specified mobile platform.</p>

```bash
ionic platform add android
```

<p>After this command you will be able to generate, build or emulate the application into the added platforms but you will need to install the needed SDK. In the case of Android you can follow the to add the SDK to your development box. A practical way to do it is installing and tune up the Android Studio and the Android SDK.</p>
<p><a href="https://developer.android.com/studio/index.html">https://developer.android.com/studio/index.html</a></p>
<img class="size-medium" src="../images/hero_image_studio.png" />
<h2>Adding Firebase libraries to the Ionic App project</h2>
<p>We base our backend with <a href="http://blog.jmtalarn.com/build-publish-ionic-app-configuring-firebase/">Firebase</a> and Ionic Framework adds Angular to build the application. So we will install the JS libraries needed. We use the bower command to install the dependency and use it locally:</p>

```bash
bower install firebase --save
```

<p>To help us in the development we added also the <a href="https://www.firebase.com/docs/web/libraries/angular/api.html">AngularFire</a> library to provide an easy use and access to the objects and collections of objects from the Firebase realtime database with the Angular Framework. AngularFire is the officially supported AngularJS binding for Firebase.</p>

```bash
bower install angularfire --save
```

<p>In both cases we add the <em>--save</em> flag to save it in dependencies definition and persist it on the project.</p>
<h2>Ionic commands</h2>

```bash
ionic serve
```

<p>This command opens a browser and display the result of the application in the standard view. If we need to show it as it was a handheld device we need to run the developer tools in Chrome, Firefox or the browser you use and adjust it in the options. This will open a server in a specific port and will be aware of live changes in code to automatically update the view.</p>

```bash
ionic serve --lab
```

<p>Like the previous command but this one opens a browser with the views that will be generated for the iOS and Android versions of the app. Both at the same time and synchronized one from another.</p>
<p><img class="size-medium" src="../images/ionic11.png" alt="Ionic app with iOS and Android views at the same time" width="600" height="517" /> Ionic app with iOS and Android views at the same time</p>

<p>Other interesting commands in the development are the following:</p>

```bash
ionic build android
```

<p>This will generate the APK package with the content of the application if the Android SDK is correctly installed on the system.</p>

```bash
ionic emulate android
```

<p>This will launch an emulator running the app.</p>

```bash
ionic run android
```

<p>This will run the app into a device with USB debuggging enabled connected to the system as <a href="http://developer.android.com/tools/device.html">described in the Android developer site</a>. It will also automatically update if any change is detected in the source code of the application and is very useful for online debugging.<br />
If this doesn’t work, make sure you have USB debugging enabled on your device, as <a href="http://developer.android.com/tools/device.html">described</a> on the Android developer site.</p>
<h2>The index.html file of the Ionic App</h2>
<p>This is the final index.html file used in the project.</p>

```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width"
    />
    <title></title>
    <link rel="manifest" href="manifest.json" />
    <!-- un-comment this code to enable service worker <script> if ('serviceWorker' in navigator) { navigator.serviceWorker.register('service-worker.js') .then(() => console.log('service worker installed')) .catch(err => console.log('Error',
err)); } </script>-->
    <!-- compiled css output -->
    <link href="css/ionic.app.css" rel="stylesheet" />
    <script src="lib/firebase/firebase.js"></script>
    <script src="js/init.firebase.js"></script>
    <!-- ionic/angularjs js -->
    <script src="lib/ionic/js/ionic.bundle.js"></script>
    <script src="lib/angularfire/dist/angularfire.min.js"></script>
    <script src="lib/ion-datetime-picker/release/ion-datetime-picker.min.js"></script>
    <link
      href="lib/ion-datetime-picker/release/ion-datetime-picker.min.css"
      rel="stylesheet"
    />
    <!-- cordova script (this will be a 404 during development) -->
    <script src="lib/ngCordova/dist/ng-cordova.js"></script>
    <script src="lib/ionic-native/ionic.native.min.js"></script>
    <script src="cordova.js"></script>
    <!-- your app's js -->
    <script src="js/app.js"></script>
    <script src="js/controllers.js"></script>
    <script src="js/services.js"></script>
    <script src="js/directives.js"></script>
    <script src="js/constants.js"></script>
  </head>

  <body ng-app="strikethru">
    <!-- The nav bar that will be updated as we navigate between views. -->
    <ion-nav-bar class="bar-positive">
      <ion-nav-back-button> </ion-nav-back-button>
    </ion-nav-bar>
    <!-- The views will be rendered in the <ion-nav-view> directive below Templates are in the /templates folder (but you could also have templates inline in this html file if you'd like). -->
    <ion-nav-view></ion-nav-view>
  </body>
</html>
```
