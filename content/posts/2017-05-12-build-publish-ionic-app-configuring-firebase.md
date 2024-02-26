---
title: Build and publish a Ionic App – Configuring Firebase
date: "2017-05-12T12:38:35"
type: post
slug: build-publish-ionic-app-configuring-firebase
cover: /images/featured/Firebase-header.png
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

Configure Firebase is easy-peasy. You only have to signup or author with your Google account into the [Firebase console](https://firebase.google.com/), create a new application and add the needed modules.

<!--more-->

<figure><img src="../images/Firebase.Gotoconsole.png" alt="Go to console" width="189" height="46" /></figure>
 We are going to use the Firebase Javascript SDK as we are implementing an AngularJs application.

<div style="border: 1px solid #2980b9;">
  <h3 style="padding-left: 1em;">Content</h3>
  <ul style="margin: 1em 4em;">
  <li>[Create a new project](#project)</li>
  <li>[Create an app](#app)</li>
  <li>[Adding the authentication provider with Firebase](#authentication)</li>
  <li>[Adding the realtime Firebase JSON database to our project](#database)</li>
  </ul>
</div>

<h2 id="project">Create a new project</h2>
Once you have entered on the console, you should create a project app by clicking the big **+ **button

<figure><img src="../images/Firebase-21-12-08.png" alt="Click on the + button to add a Firebase project" width="991" height="306" /> <figcaption>Click on the + button to add a project</figcaption></figure>

Write the project name and select an appropiate location. Within the project you will configure all the needed services provided by Firebase.

<figure><img src="../images/Firebase-21-13-03.png" alt="Fill the name and select a location to create a new Firebase project" width="453" height="416" />
<figcaption> Fill the name and select a location</figcaption></figure>

<h2 id="app">Create an app</h2>

<figure><img src="../images/Firebase-21-19-23.png" alt="Add a Firebase App." width="307" height="273" /><figcaption> Add an App.</figcaption></figure>

Just click on the Add another application button and this will show three options in order to continue: iOS, Android and Web.

<figure><img src="../images/Firebase-21-19-33.png" alt="Firebase support three SDKs: iOS, Android and Web" width="305" height="273" />
<figcaption> iOS, Android and Web</figcaption></figure>

As we are developing a Javascript based application,  we choose Web. It will show up a popup showing you information about the Javascript code needed to support Firebase in your project.

In our app we put the Javascript include file in the **index.html** file

```html
<script src="https://www.gstatic.com/firebasejs/3.9.0/firebase.js">
```

while we put the config object with the API keys in another file located in the www/js folder

```javascript
var config = {
	apiKey: "",
	authDomain: "",
	databaseURL: "",
	storageBucket: "",
	messagingSenderId: "",
};
firebase.initializeApp(config);
```

<h2 id="authentication">Adding the authentication provider with Firebase</h2>
<figure><img src="../images/Firebase-21-14-00.png" alt="Authentication service with Firebase" /> 
<figcaption>Authentication service with Firebase</figcaption></figure>

We start adding the Authentication provider to our Firebase project.

<figure><img src="../images/Firebase-21-17-26.png" alt="Adding Google author into our Firebase project"  /> 
<figcaption>Adding Google author support is a straight forward step.</figcaption></figure>

Once we clicked on the to start the authentication configuration we can add the Google author provider. We can click the edit option in the Google row and in the popup just click the switch to enable it.

<figure><img src="../images/EnableGoogleLoginAuthorization.png" alt="Enable Google author provider" /> 
<figcaption>Enable Google author provider</figcaption></figure>

As Firebase is integrated with the big G this step will create automatically the Google API keys to integrate the author process. Once you finished this step you can check it on the [Google APIs console](https://console.developers.google.com/cloud-resource-manager). If you want to add more author provider you will need to get manually the API keys for each service.

<h2 id="database">Adding the realtime Firebase JSON database to our project</h2>

<figure><img src="../images/Firebase-21-13-45.png" alt="Adding the Realtime Firebase JSON database support" />
<figcaption> Adding the JSON database support</figcaption></figure>

Click on Start to add the realtime database support. It will show a box  with only a key as the root of our database with a _null_ value.

<figure><img src="../images/Realtime-Database-&#8211;-Firebase-console-1024x294.png" alt="The null content of our real time JSON database with Firebase" width="640" height="184" /> 
<figcaption> The null content of our real time JSON database with Firebase</figcaption></figure>

But the interesting part in this module is the Rule section where we will define the security rules to access the data. The users only could write into the database their own information and no public information we will be accessed by another user.

<figure><img src="../images/Firebase-21-15-01.png" alt="The rules to secure our data." width="699" height="646" /> 
<figcaption> The rules to secure our data.</figcaption></figure>

```json
// These rules grant access to a node matching the authenticated
// user's ID from the auth token
{
	"rules": {
		"users": {
			"$uid": {
				".read": "$uid === auth.uid",
				".write": "$uid === auth.uid"
			}
		}
	}
}
```
