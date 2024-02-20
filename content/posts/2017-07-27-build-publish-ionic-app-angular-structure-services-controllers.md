---
title:
    "Build and publish a Ionic App – Angular application structure: services and
    factories"
date: 2017-07-27T11:35:06
type: post
slug: build-publish-ionic-app-angular-structure-services-controllers
cover: /images/featured/angular-factory.jpg
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

In any application sometimes you need to share some code or common functionalities among the components of the application. One way to do it is using a services pattern. In AngularJs Applications there are three ways to create them: services and factories.

<!--more-->
<h2>Services vs Factories in Angularjs</h2>
The first thing to know is the difference between these kind of objects. In this post <a href="https://tylermcginnis.com/angularjs-factory-vs-service-vs-provider/">https://tylermcginnis.com/angularjs-factory-vs-service-vs-provider/</a> the author gives the definitions of each kind of components and illustrate them with clear examples.

<h3>Factories</h3>
When you create a factory, you define an object with its properties and methods and return it directly. Then this same object will be used in the controllers where it is injected in the usual ways.

```javascript
app.factory("aFactory", function () {
	var property = "";
	method = function () {
		return property;
	};
	return { method: getProperty };
});
```

<h3>Services</h3>
When a service is instantiated it's called the defining function with the new keyword so the object returned is a new instance of the object created with the function.

```javascript
app.service("aService", function () {
	var property = "";
	this.getProperty = function () {
		return property;
	};
});
```

<h3>Providers</h3>
The providers are the only kind of service that you can pass to the application config function so if you have to use or configure a service in the moment you are configuring the app you need to create it as a provider. The object returned in the inner $get method will be the available when you use it in your controllers.

```javascript
app.provider("aProvider", function () {
	this.property = "";
	this.propertyWhenConfig = "";

	//Only the properties on the object returned from $get are available in the controller.
	this.$get = function () {
		var that = this;
		return {
			getProperty: function () {
				return that.property;
			},
			getPropertyWhenConfig: that.propertyWhenConfig,
		};
	};
});
```

<h2>Services and Factories in the App</h2>
These are the <a href="https://github.com/jmtalarn/strikethru/blob/master/www/js/services.js">services and factories</a> created in the development of the <a href="http://blog.jmtalarn.com/build-publish-ionic-app-i-idea/">Strikethru App with Ionic</a>

<h3>Factories</h3>
<dl>
<dt>Todos</dt>
<dd>Recover todos items from a list, and add, modify and remove as move items from list to list. These lists are the Livelist, the Dump or each one of the lists for each Vault category.</dd>
<dt>Vault</dt>
<dd>Manage Vault category, list, add, modify and delete.</dd>
<dt>Auth</dt>
<dd>Authenticatin methods like author or logout and getCurrentUser</dd>
</dl>
<h3>Services</h3>
<dl>
<dt>Calendar</dt>
<dd>Create Events to the device calendar app from the information of the item selected.</dd>
<dt>ChoosePriorityPopup</dt>
<dd>A popup service that allows you to choose a value for the priority. Using this as a service allows you to reuse the same service and not create a new component each time you need to select it.</dd>
<dt>VaultPopup</dt>
<dd>Pop up to choose Vault Category</dd>
<dt>Confirm</dt>
<dd>modal popup to confirm action</dd>
<dt>CurrentListService</dt>
<dd>From the Url or $state, it gets the current list. Useful to known from which list are you moving an item to</dd>
<dt>Setup</dt>
<dd>Service to load and check user configuration like the values 1-3-5 1-9 or kind of setup</dd>
</dl>
