---
title: Frameworks for testing your Javascript code
date: 2016-10-15T02:28:32
type: post
slug: frameworks-for-testing-your-javascript-code
cover: /images/featured/javascript.testing.jpg
category: ['Web development']
tags: ['testing', 'jasmine', 'protractor', 'mocha', 'javascript']
author: jmtalarn
---


* [Jasmine](#jasmine)
* [Karma](#karma)
* [Protractor](#protractor)
* [Mocha](#mocha)

<!--more-->

<h2 id="jasmine">Jasmine</h2>
<p><a href="http://jasmine.github.io/" target="\_blank">http://jasmine.github.io/</a><br />
<img src="../images/jasmine-horizontal.svg" alt="Frameworks for testing your Javascript code" /></p>
<blockquote><p>Jasmine is a behavior-driven development framework for testing JavaScript code. It does not depend on any other JavaScript frameworks. It does not require a DOM. And it has a clean, obvious syntax so that you can easily write tests.</p></blockquote>
<h4 id="tldr">TL;DR</h4>
<p><span class="note">Jasmine suits for testing any piece of callable javascript</span></p>
<h2 id="karma">Karma</h2>
<p><a href="https://karma-runner.github.io">https://karma-runner.github.io</a><br />
<img src="../images/karma.png" alt="Frameworks for testing your Javascript code" /></p>
<blockquote><p>Karma is essentially a tool which spawns a web server that executes source code against test code for each of the browsers connected. The results of each test against each browser are examined and displayed via the command line to the developer such that they can see which browsers and tests passed or failed.</p></blockquote>
<h4 id="tldr">TL;DR</h4>
<p><span class="note">Karma let's you use the Jasmine framework, or any other, for unit testing your Angular components like the controllers, the services or the directives.<br />
</span></p>
<h2 id="protractor">Protractor</h2>
<p><a href="http://www.protractortest.org/#/">http://www.protractortest.org/#/</a><br />
<img src="../images/protractor-logo-450.png" alt="Frameworks for testing your Javascript code" /></p>
<blockquote><p>Protractor is an end-to-end test framework for AngularJS applications. Protractor runs tests against your application running in a real browser, interacting with it as a user would.</p></blockquote>
<h4 id="tldr">TL;DR</h4>
<style>.highlight{ font-weight: bold;font-style: oblique;}</style>
<p><span class="note">Protractor will run your configured tests, with the <span class="highlight">describe</span> and <span class="highlight">it</span> syntax from the Jasmine framework, as it was a user interacting with your Angular.js application<br />
</span></p>
<h2 id="mocha">Mocha</h2>
<p><a href="https://mochajs.org/">https://mochajs.org/</a><br />
<img src="../images/mocha.svg" alt="Frameworks for testing your Javascript code" /></p>
<blockquote><p>Mocha is a feature-rich JavaScript test framework running on Node.js and in the browser, making asynchronous testing simple and fun. Mocha tests run serially, allowing for flexible and accurate reporting, while mapping uncaught exceptions to the correct test cases.</p></blockquote>
<h4 id="tldr">TL;DR</h4>
<p><span class="note">Mocha is also a unit testing framework for javascript like Jasmine is, but it doesn't include a assertion library neither a built-in mocking. However Mocha have an own test runner like Karma is for Jasmine.<br />
</span></p>
