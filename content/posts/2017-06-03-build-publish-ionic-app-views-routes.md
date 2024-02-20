---
title: Build and publish a Ionic App – Views and routes
date: 2017-06-03T02:30:28
type: post
slug: build-publish-ionic-app-views-routes
cover: /images/featured/angular-ionic-wall.jpg
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

When we <a href="http://blog.jmtalarn.com/build-publish-ionic-app-first-steps/#generating" target="\_blank">generate the application using the Ionic CLI</a> it generates the application structure to manage three tabs _Dash_, _Chats_ and \*Account\*. Angular provides a main module as the core framework and the additional required functionalities are added via modules like the URL mapping and routing. In the app skeleton generated each one of the tabs is considered a view or a state (actually that are substates of a tab state) and each one is related to an URL. Angular provides generally two modules as options to manage the URL routing: <a href="https://docs.angularjs.org/api/ngRoute" target="\_blank">Angular ngRoute</a> and <a href="https://github.com/angular-ui/ui-router" target="\_blank">AngularUI Router</a>. Ionic uses by default the ui-router.

<!--more-->
<h3>ngRoute vs ui-router</h3>
Both modules are used to manage the views related with the URLs.

**ngRouter** helps you to render views when a specified URL is requested. The URL is managed by the application in the browser and doesn't request the server to get the data because all views code is loaded when the application boots up. This is the principle of the <a href="https://en.wikipedia.org/wiki/Single-page_application">Single Page Applications (SPA)</a>. The module will load an HTML code into an element, a directive, known or marked as <code>&lt;ng-view&gt;&lt;/ng-view&gt;</code>.

The AngularUI router provides all this basic functionality but adds more options and configurations than only one state/view to an url. With this module it can be defined multiple nested views or subviews. The states can be defined with a name and this allows to reference it along your code by its name, both for change the view programatically or generate the links referencing only the name so any change in the url but that name will be applied anywhere. The target directive for ui-router is called <code>&lt;ui-view&gt;&lt;/ui-view&gt;</code>.

<h3>Defining states with ui-router</h3>
In the <a href="https://github.com/jmtalarn/strikethru/blob/master/www/js/app.js">app.js</a> file where is configured the main module of the application.

In the config method is where the states will be defined and we will use two useful providers within the ui-router:

<ul>
<li>**$stateProvider** This provider will be used to create the states</li>
<li>**$urlRouterProvider** This provider is used to redirect from one URL to another</li>
</ul>
For each state you define a name, an URL, a template containing the HTML to be rendered and a controller that will be in charge to execute the code available inside that view.

```javascript
$stateProvider;
```

This is the provider where we attached the states.

```javascript
  .state('author', {
    url: '/author',
    templateUrl: 'templates/author.html',
    controller: 'authorCtrl'
  })
```

A view where the app is presented and shows also a button to <a href="http://blog.jmtalarn.com/build-publish-ionic-app-i-idea/#technology">author the app with your Google account</a>

```javascript
  .state('logout', {
    url: '/logout',
    controller: 'logoutCtrl'
  })
```

This is a state without a view. The controller executes the sign out action and redirect again to the author view.

```javascript
  .state('loading', {
    url: '/loading',
    templateUrl: 'templates/loading.html',
    controller: 'LoadingCtrl'
  })
```

A simple view with a spinning animation to be used when large loading times occurs.

```javascript
  .state('tab', {
    url: '/tab',
    abstract: true,
    templateUrl: 'templates/tabs.html',
    controller: 'TabCtrl'
  })
```

This is the state and controller with the tab container. The controller checks which tabs should be showed depending on the Strikethru setup. Each one of the tabs will be a nested state.

```javascript
  .state('tab.livelist', {
    url: '/livelist',
    views: {
      'tab-livelist': {
        templateUrl: 'templates/tab-livelist.html',
        controller: 'LivelistCtrl'
      }
    }
  })
```

This is the first tab related with the **<a href="http://striketh.ru/how-it-works/">livelist</a>**, the list of hot items ready to be done.

```javascript
  .state('tab.vault', {
    url: '/vault',
    views: {
      'tab-vault': {
        templateUrl: 'templates/tab-vault.html',
        controller: 'VaultCtrl'
      }
    }
  })
```

This is <a href="http://striketh.ru/how-it-works/">**the vault**</a> tab where there are the list of category or projects where the pending items are classified previously to be moved to the livelist when are ready.

```javascript
  .state('tab.vault-detail', {
    url: '/vault/:vaultId',
    views: {
      'tab-vault': {
        templateUrl: 'templates/vault-detail.html',
        controller: 'VaultDetailCtrl'
      }
    }
  })
```

This is the view with the form where the vault category can be edited or created.

```javascript
  .state('tab.dump', {
    url: '/dump',
    views: {
      'tab-dump': {
        templateUrl: 'templates/tab-dump.html',
        controller: 'DumpCtrl'
      }
    }
  })
```

This is the view for the <a href="http://striketh.ru/how-it-works/">Dump</a> where you can add any notes, annotations or ideas (in the shape of a todo item)

```javascript
  .state('tab.vault-todo-detail', {
    url: '/vault/:vaultId/todo/:todoId',
    views: {
      'tab-vault': {
        templateUrl: 'templates/todo-detail.html',
        controller: 'TodoDetailCtrl'
      }
    }
  })
  .state('tab.livelist-detail', {
    url: '/livelist/todo/:todoId',
    views: {
      'tab-livelist': {
        templateUrl: 'templates/todo-detail.html',
        controller: 'TodoDetailCtrl'
      }
    }
  })
  .state('tab.dump-detail', {
    url: '/dump/todo/:todoId',
    views: {
      'tab-dump': {
        templateUrl: 'templates/todo-detail.html',
        controller: 'TodoDetailCtrl'
      }
    }
  })
```

These are the views where the items of the list are edited or created. There is a state for each item detail depending on the list where the item belongs because it can have a different URL depending on it.

```javascript
  .state('tab.setup', {
    url: '/setup',
    views: {
      'tab-setup': {
        templateUrl: 'templates/tab-setup.html',
        controller: 'SetupCtrl'
      }
    }
  });
```

This is the view state where you can edit the app configuration preferences and also log out from the app.
