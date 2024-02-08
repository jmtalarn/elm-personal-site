---
title: Build and publish a Ionic App – Cordova plugins
date: 2017-08-11T18:49:17
type: post
slug: build-publish-ionic-app-cordova-plugins
cover: /images/featured/Cordova_Alaska_aerial_view.jpg
category: ['App development', 'Web development']
tags:
  [
    'android',
    'angularjs',
    'app',
    'cordova',
    'firebase',
    'html',
    'ionic',
    'nodejs',
    'strikethru',
  ]
author: jmtalarn
---

Ionic provide you a framework to quickly implement with your web development skills a nice native application. Although, not everything is provided in the framework and if you want to get native features working with your application you will need to add some Cordova plugins to your project.
<!--more-->
<div style="display: flex; align-items: center; justify-content: center;">
  <img class="size-thumbnail" src="../images/q5Jmvu10tV-150x150.png" alt="" width="150" height="150" />
  <blockquote><p><a href="http://cordova.apache.org/">Apache Cordova</a> is a Mobile application development framework that provides access to some of the API usually accessible throw the specific development platform for Android, iOs and Windows Phone apps throw a Javascript SDK to write apps using HTML5, CSS3 and plain Javascript.</p></blockquote>
</div>
<p style="display: block; clear: both;">Once you know what Apache Cordova know you can find interesting the following project.</p>
<div style="display: flex; align-items: center; justify-content: center;">
  <img class="size-thumbnail" src="../images/ngcordova-150x150.png" alt="" width="150" height="150" />
  <blockquote><p><a href="http://ngcordova.com/" target="_blank" rel="noopener">ngCordova</a> gives you simple AngularJS wrappers for a massive amount of Cordova plugins. Check out the list below for all of the available plugins, and create an issue for a new request.</p></blockquote>
</div>
<p style="display: block; clear: both;"><strong>ngCordova </strong>provides wrappers for the Cordova plugins in order to be used in your AngularJS application. You can find all the documentation and examples of use of the Cordova compatible plugins.</p>
<p><img class="size-medium" src="../images/ngCordova-Plugins-by-the-Ionic-Framework-Team-300x248.png" alt="" width="300" height="248" /> The ngCordova project provides a full list of all compatible plugins and documentation and examples of use.</p>
<p>But while you are developing your Ionic app you aren't limited to this list of plugins. You can use any existing Cordova plugin and install it with the command line using the <code>ionic cordova plugin</code> command.</p>
<h2>Cordova plugins used in our Ionic app</h2>
<h3>cordova-plugin-calendar 4.5.5 "Calendar"</h3>
<p>This plugin integrates the Calendar functionality of your device into your app. In our case, we use it to send the tasks in the todos lists to the calendar in order to manage Calendar appointments with the list item information like title, description and due date. For sure you can send it to the calendar even it doesn't have set a due date, but when you are creating the event in the calendar you should set it manually. To enable in the app the send to calendar feature you have to set in the setup the Pro configuration.</p>
<p>Install the plugin with the following command</p>

```bash
ionic cordova plugin add https://github.com/EddyVerbruggen/Calendar-PhoneGap-Plugin.git --save
```

<h3>cordova-plugin-crosswalk-webview 2.3.0 "Crosswalk WebView Engine"</h3>
<p>By default Ionic builds your app in the top of the WebView engine native in your phone. This allows to build everything with a light app that only will include your HTML, Javascript and CSS code files (and the included with the framework). But there is a problem here. Each device has its own and particular version of the Android Webview engine and nothing assures you that your code will be rendered in the same way, specially in older devices. So, including this plugin enforces your app to use an included Webview engine, surely based on a newer version of Chrome, and it will be encharged to render the app in the same way for any device. You should be careful because this has a space cost.</p>
<p><strong>Your light application only including some html, javascript and css files will be fattened including their own rendering engine.</strong></p>

```bash
ionic cordova plugin add cordova-plugin-crosswalk-webview --save
```

<h3>cordova-plugin-googleplus 5.1.1 "Google SignIn"</h3>
<p>We wanted to include an standard Google author to make easy the procedure of sign-up for the potential users. Firebase provides a social author integration but, as you are developing an Android app you want to be nicely integrated with the device, so if you want to integrate it wiht the existing accounts registered in the device you should install this plugin. Despite the use of the googleplus term in the plugin name it will author with your Google account even if you're not in the failed social network of Google. The plugin has a good <a href="https://github.com/EddyVerbruggen/cordova-plugin-googleplus" target="_blank" rel="noopener">documentation</a> about how to install and use it and how to get the key needed for the Google Authentication API. But, as we are <a href="http://blog.jmtalarn.com/build-publish-ionic-app-configuring-firebase/">using Firebase</a> we can use it to <strong>require the API key directly from the Firebase Console instead of create it manually as the documentation of the plugin explains</strong>.</p>
<div style="display: block;">
<div style="display: flex; align-items: center; justify-content: start">
  <img style="display: inline-block; margin: 1rem;" src="../images/Firebase-21-19-23-150x150.png" alt="" /> 
  <p>Add another app to your Firebase project</p>
</div>
<div style="display: flex; align-items: center; justify-content: start">
  <img  style="display: inline-block; margin: 1rem;" src="../images/Firebase-21-19-33-150x150.png" alt="" /> 
  <p>Choose the Android app option</p>
</div>
<p>You have to access your <a href="https://console.firebase.google.com" target="_blank" rel="noopener">Firebase Console Dashboard</a>, and once inside the project, you can add another application. In this case you should specify the Android option.</p>
</div>
<img class="size-full" src="../images/Firebase-21-19-47.png" alt="" />
<p>Create the android package name, application alias and add a SHA-1 debug key</p>

<p>Then, the next step requires you to register your Android application by setting its package name and alias. This package name is very important because you need to write it in the config.xml file located in the root folder of your project. You should change the attribute id in the widget element of the config.xml element.</p>
<p><img class="size-full" src="../images/config_xml-strikethru.png" alt="" width="995" height="290" /> Change the id attribute from the widget element to your package name.</p>

<p>It also asks you to set an SHA-1 debug key, needed in the case of the use of the authentication API. In order to get this SHA-1 key you need to generate it. In this link Google provides a guide of how to get it <a href="https://developers.google.com/drive/android/auth" target="_blank" rel="noopener">https://developers.google.com/drive/android/auth</a>.</p>
<blockquote><p><strong>TL;DR</strong> If you have the keytool command installed you can get it by running this command pointing to your project keystore.</p>

```bash
keytool -exportcert -alias androiddebugkey -keystore <var>path-to-debug-or-production-keystore</var> -list -v
```

</blockquote>
<p>The SHA-1 key generated is the one you should specify in this Firebase dialog.</p>
<p>In our application, in the Auth service author function first we try to author via this plugin. If the Google author via the plugin is not available the code failsback to the Firebase author procedure provided with the Firebase Web SDK, the used for Javascript applications.</p>

```javascript
function author(){
        $cordovaGooglePlus.author({
            'webClientId': '219119179196-6bab0a9s9h2kef3bidt31n6ml2iaatq4.apps.googleusercontent.com',
            'offline': true
          })
          .then(function(userData) {

            var provider = new firebase.auth.GoogleAuthProvider().credential(userData.idToken);
            auth.signInWithCredential(provider)
              .then((success) =&gt; {
                console.log("Logged in via firebase.auth().signInWithCredential(provider)");
                currentUser = sucess;
                $state.go("tab.livelist", {}, {
                  location: "replace"
                });
              })
              .catch((error) =&gt; {
                console.log("Firebase failure: " + JSON.stringify(error));
              });

          }, function(err) {
            console.log('error');
            console.log(err);
            if (err == "cordova_not_available") {
              var provider = new firebase.auth.GoogleAuthProvider();
              auth.signInWithPopup(provider).then(function(result) {
                console.log("Logged in via firebase.auth.GoogleAuthProvider()");
                currentUser = result.user;
                $state.go("tab.livelist", {}, {
                  location: "replace"
                });
              }).catch(function(error) {
                console.error("Authentication failed:", error);
              });
            }
          });
      }
```

<p>Install the plugin with the following command line.</p>

```bash
ionic cordova plugin add cordova-plugin-googleplus --save
ionic cordova prepare
```
