---
title: Frameworks for testing your Javascript code
date: "2016-10-15T02:28:32"
type: post
slug: frameworks-for-testing-your-javascript-code
cover: /images/featured/javascript.testing.jpg
category: ["Web development"]
tags: ["testing", "jasmine", "protractor", "mocha", "javascript"]
author: jmtalarn
---

-   [Jasmine](#jasmine)
-   [Karma](#karma)
-   [Protractor](#protractor)
-   [Mocha](#mocha)

<!--more-->

## Jasmine

[http://jasmine.github.io/](http://jasmine.github.io/)

![Frameworks for testing your Javascript code](/images/jasmine-horizontal.svg)

> Jasmine is a behavior-driven development framework for testing JavaScript code. It does not depend on any other JavaScript frameworks. It does not require a DOM. And it has a clean, obvious syntax so that you can easily write tests.

#### TL;DR

Jasmine suits for testing any piece of callable javascript

## Karma

[https://karma-runner.github.io](https://karma-runner.github.io)  
![Frameworks for testing your Javascript code](/images/karma.png)

> Karma is essentially a tool which spawns a web server that executes source code against test code for each of the browsers connected. The results of each test against each browser are examined and displayed via the command line to the developer such that they can see which browsers and tests passed or failed.

#### TL;DR

Karma let's you use the Jasmine framework, or any other, for unit testing your Angular components like the controllers, the services or the directives.

## Protractor

[http://www.protractortest.org/#/](http://www.protractortest.org/#/)  
![Frameworks for testing your Javascript code](/images/protractor-logo-450.png)

> Protractor is an end-to-end test framework for AngularJS applications. Protractor runs tests against your application running in a real browser, interacting with it as a user would.

#### TL;DR

Protractor will run your configured tests, with the `describe` and `it` syntax from the Jasmine framework, as it was a user interacting with your Angular.js application

## Mocha

[https://mochajs.org/](https://mochajs.org/)  
![Frameworks for testing your Javascript code](/images/mocha.svg)

> Mocha is a feature-rich JavaScript test framework running on Node.js and in the browser, making asynchronous testing simple and fun. Mocha tests run serially, allowing for flexible and accurate reporting, while mapping uncaught exceptions to the correct test cases.

#### TL;DR

Mocha is also a unit testing framework for javascript like Jasmine is, but it doesn't include a assertion library neither a built-in mocking. However Mocha have an own test runner like Karma is for Jasmine.
