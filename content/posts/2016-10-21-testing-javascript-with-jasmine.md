---
title: Testing Javascript with Jasmine
date: 2016-10-21T23:56:58
type: post
slug: testing-javascript-with-jasmine
cover: /images/featured/jasmine-horizontal.png
category: ['Web development']
tags: ['testing', 'jasmine', 'javascript']
author: jmtalarn
---

## Jasmine

<a href="http://jasmine.github.io/" target="\_blank">http://jasmine.github.io/</a>
<blockquote>Jasmine is a behavior-driven development framework for testing JavaScript code. It does not depend on any other JavaScript frameworks. It does not require a DOM. And it has a clean, obvious syntax so that you can easily write tests.</blockquote>
<!--more-->
<p>As its description says, Jasmine helps you to test any testable piece of javascript. For the seasoned java developers is very similar to the <a href="http://junit.org/junit4/">jUnit</a> approach: you create a suite in which you define a set of tests with its appropiate assertions.<br />
You can create your custom matchers but by default Jasmine has a large list of matchers to create your assertions:</p>
<style>
.jasmine-matchers th, .jasmine-matchers td{ border: 1px solid lightblue; padding: 10px;}<br />
.jasmine-matchers td{ font-family: monospace; font-size: 0.8em; }<br />
.jasmine-matchers th{ text-align: left; text-transform: uppercase; }</p>
</style>
<table class="jasmine-matchers">
<thead>
<tr>
<th colspan="3">Jasmine default matchers</th>
</tr>
<tr>
<th>the matcher</th>
<th>negation</th>
<th>Expectation</th>
</tr>
</thead>
<tbody>
<tr>
<th colspan="3">Equality</th>
</tr>
<tr>
<td>expect(a).toBe(b)</td>
<td>expect(a).not.toBe(null)</td>
<td>The 'toBe' matcher compares with ===</td>
</tr>
<tr>
<td>expect(foo).toEqual(bar)</td>
<td>expect(foo).not.toEqual(bar)</td>
<td>The 'toEqual' matcher. Works for simple literals and variables and also for objects</td>
</tr>
<tr>
<th colspan="3">Regular expressions</th>
</tr>
<tr>
<td>expect(message).toMatch(/bar/);</td>
<td>expect(message).not.toMatch(/quux/);</td>
<td>The 'toMatch' matcher is for regular expressions</td>
</tr>
<tr>
<th colspan="3">Undefined or null</th>
</tr>
<tr>
<td>expect(a.foo).toBeDefined();</td>
<td>expect(a.bar).not.toBeDefined();</td>
<td>The 'toBeDefined' matcher compares against `undefined`</td>
</tr>
<tr>
<td>expect(a.foo).not.toBeUndefined();</td>
<td>expect(a.bar).toBeUndefined();</td>
<td>The `toBeUndefined` matcher compares against `undefined`</td>
</tr>
<tr>
<td>expect(null).toBeNull();</td>
<td>expect(foo).not.toBeNull();</td>
<td>The 'toBeNull' matcher compares against null</td>
</tr>
<tr>
<th colspan="3">Boolean matchers</th>
</tr>
<tr>
<td>expect(foo).toBeTruthy();</td>
<td>expect(a).not.toBeTruthy();</td>
<td>The 'toBeTruthy' matcher is for boolean casting testing</td>
</tr>
<tr>
<td>expect(a).toBeFalsy();</td>
<td>expect(foo).not.toBeFalsy();</td>
<td>"The 'toBeFalsy' matcher is for boolean casting testing</td>
</tr>
<tr>
<th colspan="3">Arrays</th>
</tr>
<tr>
<td>expect(a).toContain("bar");</td>
<td>expect(a).not.toContain("quux");</td>
<td>The 'toContain' matcher is for finding an item in an Array</td>
</tr>
<tr>
<th colspan="3">Arithmetical matchers</th>
</tr>
<tr>
<td>expect(e).toBeLessThan(pi);</td>
<td>expect(pi).not.toBeLessThan(e);</td>
<td>The 'toBeLessThan' matcher is for mathematical comparisons</td>
</tr>
<tr>
<td>expect(pi).toBeGreaterThan(e);</td>
<td>expect(e).not.toBeGreaterThan(pi);</td>
<td>The 'toBeGreaterThan' matcher is for mathematical comparisons</td>
</tr>
<tr>
<td>expect(pi).not.toBeCloseTo(e, 2);</td>
<td>expect(pi).toBeCloseTo(e, 0);</td>
<td>The 'toBeCloseTo' matcher is for precision math comparison</td>
</tr>
<tr>
<th colspan="3">Expecting exceptions</th>
</tr>
<tr>
<td>expect(bar).toThrow();</td>
<td>expect(foo).not.toThrow();</td>
<td>The 'toThrow' matcher is for testing if a function throws an exception</td>
</tr>
<tr>
<td>expect(foo).toThrowError(TypeError);</p>
<p>expect(foo).toThrowError(TypeError, "foo bar baz");</td>
<td></td>
<td>The 'toThrowError' matcher is for testing a specific thrown exception</td>
</tr>
</tbody>
</table>
<p>And in order to execute it you only have to run them in any browser able to run Javascript to run the test. This is an example:</p>
<p><strong>function.js file</strong></p>

```javascript
function helloWorld() {
  return 'Hello world!'
}
```

<p><strong>test-specs.js file</strong></p>

```javascript
describe('Hello world', function() {
  it('says hello', function() {
    expect(helloWorld()).toEqual('Hello world!')
  })
})
```

<p><strong>specrunner.html</strong></p>

```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>Jasmine Spec Runner</title>

    <link
      rel="shortcut icon"
      type="image/png"
      href="lib/jasmine/jasmine_favicon.png"
    />
    <link rel="stylesheet" href="lib/jasmine/jasmine.css" />

    <script src="lib/jasmine/jasmine.js"></script>
    <script src="lib/jasmine/jasmine-html.js"></script>
    <script src="lib/jasmine/boot.js"></script>

    <!-- include source files here... -->
    <script src="function.js"></script>

    <!-- include spec files here... -->
    <script src="test-specs.js"></script>
  </head>

  <body></body>
</html>
```

<p>If you open the html in any browser with javascript enabled you can get the results of the tests executions. Jasmine comes with a set of libraries in order to process these results and show up them into a specific format.<br />
<img src="../images/2016-10-15-01_56_10-Jasmine-Spec-Runner----Microsoft-Edge.png" alt="Testing Javascript with Jasmine" /><br />
You also have some options to change and rerun the tests under these changes.<br />
<img src="../images/2016-10-15-01_56_38-Jasmine-Spec-Runner----Microsoft-Edge.png" alt="Testing Javascript with Jasmine" /></p>
<p><span class="note">Jasmine suits for testing any piece of callable javascript</span></p>
