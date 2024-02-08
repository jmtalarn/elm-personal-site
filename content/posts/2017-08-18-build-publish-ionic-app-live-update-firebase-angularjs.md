---
title: Build and publish a Ionic App – Live update of Firebase backend with AngularJS
date: 2017-08-18T14:28:28
type: post
slug: build-publish-ionic-app-live-update-firebase-angularjs
cover: /images/featured/live_update.jpg
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

We wanted to create a kind of live update of the Firebase backend while the users were using the app avoiding to put Save button actions in order to save. The idea is to keep the backend updated while the user is creating or updating any element, these are ToDo items and category elements, in our application. So we needed to implement a system with the help of the library Angularfire and the $watch AngularJs function to make it happen.<br />
<!--more-->
<h2>Binding AngularJS models to Firebase with AngularFire</h2>
<p>We use Firebase as the backend and in order to integrate it better with our AngularJS application we installed also the <a href="http://blog.jmtalarn.com/build-publish-ionic-app-first-steps/">angularfire</a> library.</p>
<blockquote><p>AngularFire is the officially supported AngularJS binding for Firebase. This binding lets you associate Firebase references with Angular models so that they will be transparently and immediately kept in sync with the database and with all other clients currently using your application.</p></blockquote>
<p>In our <a href="http://blog.jmtalarn.com/build-publish-ionic-app-angular-structure-services-controllers/">factory for managing ToDo items </a> we created the connection needed to open the references to our ToDo items lists.</p>

```javascript
.factory('Todos', function($firebaseArray, CurrentListService, $ionicLoading, Auth)
```

<p>As we can observe in the factory declaration we added the $firebaseArray dependence.</p>
<blockquote><p>The $firebaseArray service takes a Firebase reference or Firebase Query and returns a JavaScript array which contains the data at the provided Firebase reference. Note that the data will not be available immediately since retrieving it is an asynchronous operation. You can use the $loaded() promise to get notified when the data has loaded.</p></blockquote>
<p>As it describes the definition of the object, it provides a service to get the elements contained in the collection of a Firebase reference. Once declared the reference to be linked with this service the data isn't inmediately available as it works with the promises concept.</p>
<h4>If you want read more about Javascript promises</h4>
<ul>
<li><a href="https://developers.google.com/web/fundamentals/getting-started/primers/promises" target="_blank" rel="noopener">https://developers.google.com/web/fundamentals/getting-started/primers/promises</a></li>
<li><a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise" target="_blank" rel="noopener">https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise</a></li>
</ul>

```javascript
var database = firebase.database()
var userId = Auth.getCurrentUser().uid
var livelistRef = firebase
  .database()
  .ref('users/' + userId + '/todos')
  .child('livelist')
var dumpRef = firebase
  .database()
  .ref('users/' + userId + '/todos')
  .child('dump')
var vaultRef = firebase
  .database()
  .ref('users/' + userId + '/todos')
  .child('vault')
```

<p>With the code above we get the Firebase references, per logged user, and with the following lines we'll get the linked Firebase Array objects.</p>

```javascript
var livelist = $firebaseArray(livelistRef.orderByChild('priority'))
var dump = $firebaseArray(dumpRef.orderByChild('priority'))
var vault = {}
```

<p>Note that livelist and dump are simple lists whilst the Vault list depends on a category to get the list of Todos Items.</p>

```javascript
var getArray = function(list, vaultId) {
  if ('livelist' == list) {
    return livelist
  } else if ('dump' == list) {
    return dump
  } else if ('vault' == list) {
    if (vault[vaultId]) {
      return vault[vaultId]
    } else {
      var userId = Auth.getCurrentUser().uid
      var vaultRef = firebase
        .database()
        .ref('users/' + userId + '/todos/vault/' + vaultId)
        .child('list')
      vault[vaultId] = $firebaseArray(vaultRef.orderByChild('priority'))
    }
    return vault[vaultId]
  }
}
```

<p>Once you created a connection to a collection in the Firebase backend AngularFire is in charge to keep up the collection updated in our referenced link.</p>
<h2>The AngularJS $watch function</h2>
<p>The <code>watch</code> function allows to bind a listener function to a variable or expression from a scope.</p>

```javascript
$watch(watchExpression, listener, [objectEquality])
```

<p>This means that you could be aware of the changes in a variable or a value derived of a controller scope and run a function when this happens. In the case of our Strikethru notebook app we want to be listening for changes in the editing form for the TOdo items as also the category edition. Continuing with the example of the Todos, this time we have to take a look to the controller of the editing page.</p>

```javascript
.controller('TodoDetailCtrl', function($scope, $stateParams, Todos, Vault, $timeout, VaultPopup, ChoosePriorityPopup, CurrentListService, Confirm, LABELS, Setup, $state, Calendar)
```

<p>In the Scope of this controller we defined a todo variable where the information of the todo item to edit or add is stored.</p>

```javascript
$scope.todo = $stateParams.todoId
  ? Todos.get($stateParams.todoId)
  : {
      list: state.list,
      listId: state.id ? state.id : null,
    } //Set current list
$scope.autosave = {
  enabled: true,
}
```

<p>If the view state contains the todo Id it means that it already exists and the mission of the controller is retrieve it from the Firebase Array managed in the Todos factory we've seen in the previous section. Otherwise it will assign a new object only with the information of the current list (livelist, dump or vault category).<br />
As we described we use the <code>watch</code> function to listen to variable changes so we added the following code.</p>

```javascript
$scope.$watch('todo', function(newVal, oldVal) {
      if (newVal != oldVal &amp;&amp; $scope.autosave.enabled) {
        if (timeout) {
          $timeout.cancel(timeout)
        }
        timeout = $timeout(update, 2000); // 1000 = 1 second

      }
    }, true);
```

<p>What this function does is check for changes from the old value to the new one and if the <code>autosave.enabled</code> variable is true it will proceed to set a timeout of two seconds to run the update function. This delay allows to avoid launching an update operation for each single change in the todo item. Also any update operation will cancel the waiting update operation.</p>

```javascript
$scope.remove = function(todo) {
  $scope.autosave.enabled = false
  if (timeout) {
    $timeout.cancel(timeout)
  }
  Confirm.show(
    LABELS.DELETE.TODO.TITLE,
    LABELS.DELETE.TODO.TEMPLATE,
    function(el) {
      Todos.remove(el)
      var state = el.list == 'vault' ? 'tab.vault-detail' : 'tab.' + el.list
      var objParams = {}
      if (el.listId) {
        objParams.vaultId = el.listId
      }
      $state.go(state, objParams, {
        location: 'replace',
      })
    },
    todo,
    $scope.autosave
  )
}
```

<p>In the same way, if we want to delete an item, the delay allows to cancel the operation before proceed with the  deletion of the element. Also when a delete is performed beyond cancelling any pending update operation it will set the <code>autosave.enabled</code> to false and it will act as a semaphore in red to any attempt to update meanwhile the operation ends.</p>
