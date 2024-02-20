---
title: Testing Javascript with Jasmine
date: 2016-10-21T23:56:58
type: post
slug: testing-javascript-with-jasmine
cover: /images/featured/jasmine-horizontal.png
category: ["Web development"]
tags: ["testing", "jasmine", "javascript"]
author: jmtalarn
---

## Jasmine

<a href="http://jasmine.github.io/" target="\_blank">http://jasmine.github.io/</a>

<blockquote>Jasmine is a behavior-driven development framework for testing JavaScript code. It does not depend on any other JavaScript frameworks. It does not require a DOM. And it has a clean, obvious syntax so that you can easily write tests.</blockquote>
<!--more-->
As its description says, Jasmine helps you to test any testable piece of javascript. For the seasoned java developers is very similar to the <a href="http://junit.org/junit4/">jUnit</a> approach: you create a suite in which you define a set of tests with its appropiate assertions.

You can create your custom matchers but by default Jasmine has a large list of matchers to create your assertions:

<table class="jasmine-matchers">
<thead>
<tr>
<th style="text-align: left; text-transform: uppercase; border: 1px solid lightblue; padding: 10px;" colspan="3">Jasmine default matchers</th>
</tr>
<tr>
<th>the matcher</th>
<th>negation</th>
<th>Expectation</th>
</tr>
</thead>
<tbody>
<tr>
<th style="text-align: left; text-transform: uppercase; border: 1px solid lightblue; padding: 10px;" colspan="3">Equality</th>
</tr>
<tr>
<td style="border: 1px solid lightblue; padding: 10px;" >expect(a).toBe(b)</td>
<td style="border: 1px solid lightblue; padding: 10px;" >expect(a).not.toBe(null)</td>
<td style="border: 1px solid lightblue; padding: 10px;" >The 'toBe' matcher compares with ===</td>
</tr>
<tr>
<td style="border: 1px solid lightblue; padding: 10px;" >expect(foo).toEqual(bar)</td>
<td style="border: 1px solid lightblue; padding: 10px;" >expect(foo).not.toEqual(bar)</td>
<td style="border: 1px solid lightblue; padding: 10px;" >The 'toEqual' matcher. Works for simple literals and variables and also for objects</td>
</tr>
<tr>
<th style="text-align: left; text-transform: uppercase; border: 1px solid lightblue; padding: 10px;" colspan="3">Regular expressions</th>
</tr>
<tr>
<td style="border: 1px solid lightblue; padding: 10px;" >expect(message).toMatch(/bar/);</td>
<td style="border: 1px solid lightblue; padding: 10px;" >expect(message).not.toMatch(/quux/);</td>
<td style="border: 1px solid lightblue; padding: 10px;" >The 'toMatch' matcher is for regular expressions</td>
</tr>
<tr>
<th style="text-align: left; text-transform: uppercase; border: 1px solid lightblue; padding: 10px;" colspan="3">Undefined or null</th>
</tr>
<tr>
<td style="border: 1px solid lightblue; padding: 10px;" >expect(a.foo).toBeDefined();</td>
<td style="border: 1px solid lightblue; padding: 10px;" >expect(a.bar).not.toBeDefined();</td>
<td style="border: 1px solid lightblue; padding: 10px;" >The 'toBeDefined' matcher compares against `undefined`</td>
</tr>
<tr>
<td style="border: 1px solid lightblue; padding: 10px;" >expect(a.foo).not.toBeUndefined();</td>
<td style="border: 1px solid lightblue; padding: 10px;" >expect(a.bar).toBeUndefined();</td>
<td style="border: 1px solid lightblue; padding: 10px;" >The `toBeUndefined` matcher compares against `undefined`</td>
</tr>
<tr>
<td style="border: 1px solid lightblue; padding: 10px;" >expect(null).toBeNull();</td>
<td style="border: 1px solid lightblue; padding: 10px;" >expect(foo).not.toBeNull();</td>
<td style="border: 1px solid lightblue; padding: 10px;" >The 'toBeNull' matcher compares against null</td>
</tr>
<tr>
<th style="text-align: left; text-transform: uppercase; border: 1px solid lightblue; padding: 10px;" colspan="3">Boolean matchers</th>
</tr>
<tr>
<td style="border: 1px solid lightblue; padding: 10px;" >expect(foo).toBeTruthy();</td>
<td style="border: 1px solid lightblue; padding: 10px;" >expect(a).not.toBeTruthy();</td>
<td style="border: 1px solid lightblue; padding: 10px;" >The 'toBeTruthy' matcher is for boolean casting testing</td>
</tr>
<tr>
<td style="border: 1px solid lightblue; padding: 10px;" >expect(a).toBeFalsy();</td>
<td style="border: 1px solid lightblue; padding: 10px;" >expect(foo).not.toBeFalsy();</td>
<td style="border: 1px solid lightblue; padding: 10px;" >"The 'toBeFalsy' matcher is for boolean casting testing</td>
</tr>
<tr>
<th style="text-align: left; text-transform: uppercase; border: 1px solid lightblue; padding: 10px;" colspan="3">Arrays</th>
</tr>
<tr>
<td style="border: 1px solid lightblue; padding: 10px;" >expect(a).toContain("bar");</td>
<td style="border: 1px solid lightblue; padding: 10px;" >expect(a).not.toContain("quux");</td>
<td style="border: 1px solid lightblue; padding: 10px;" >The 'toContain' matcher is for finding an item in an Array</td>
</tr>
<tr>
<th style="text-align: left; text-transform: uppercase; border: 1px solid lightblue; padding: 10px;" colspan="3">Arithmetical matchers</th>
</tr>
<tr>
<td style="border: 1px solid lightblue; padding: 10px;" >expect(e).toBeLessThan(pi);</td>
<td style="border: 1px solid lightblue; padding: 10px;" >expect(pi).not.toBeLessThan(e);</td>
<td style="border: 1px solid lightblue; padding: 10px;" >The 'toBeLessThan' matcher is for mathematical comparisons</td>
</tr>
<tr>
<td style="border: 1px solid lightblue; padding: 10px;" >expect(pi).toBeGreaterThan(e);</td>
<td style="border: 1px solid lightblue; padding: 10px;" >expect(e).not.toBeGreaterThan(pi);</td>
<td style="border: 1px solid lightblue; padding: 10px;" >The 'toBeGreaterThan' matcher is for mathematical comparisons</td>
</tr>
<tr>
<td style="border: 1px solid lightblue; padding: 10px;" >expect(pi).not.toBeCloseTo(e, 2);</td>
<td style="border: 1px solid lightblue; padding: 10px;" >expect(pi).toBeCloseTo(e, 0);</td>
<td style="border: 1px solid lightblue; padding: 10px;" >The 'toBeCloseTo' matcher is for precision math comparison</td>
</tr>
<tr>
<th style="text-align: left; text-transform: uppercase; border: 1px solid lightblue; padding: 10px;" colspan="3">Expecting exceptions</th>
</tr>
<tr>
<td style="border: 1px solid lightblue; padding: 10px;" >expect(bar).toThrow();</td>
<td style="border: 1px solid lightblue; padding: 10px;" >expect(foo).not.toThrow();</td>
<td style="border: 1px solid lightblue; padding: 10px;" >The 'toThrow' matcher is for testing if a function throws an exception</td>
</tr>
<tr>
<td style="border: 1px solid lightblue; padding: 10px;" >expect(foo).toThrowError(TypeError);

expect(foo).toThrowError(TypeError, "foo bar baz");</td>

<td style="border: 1px solid lightblue; padding: 10px;" ></td>
<td style="border: 1px solid lightblue; padding: 10px;" >The 'toThrowError' matcher is for testing a specific thrown exception</td>
</tr>
</tbody>
</table>

And in order to execute it you only have to run them in any browser able to run Javascript to run the test. This is an example:

**function.js file**

```javascript
function helloWorld() {
	return "Hello world!";
}
```

**test-specs.js file**

```javascript
describe("Hello world", function () {
	it("says hello", function () {
		expect(helloWorld()).toEqual("Hello world!");
	});
});
```

**specrunner.html**

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

If you open the html in any browser with javascript enabled you can get the results of the tests executions. Jasmine comes with a set of libraries in order to process these results and show up them into a specific format.

<img src="../images/2016-10-15-01_56_10-Jasmine-Spec-Runner----Microsoft-Edge.png" alt="Testing Javascript with Jasmine" />

You also have some options to change and rerun the tests under these changes.

<img src="../images/2016-10-15-01_56_38-Jasmine-Spec-Runner----Microsoft-Edge.png" alt="Testing Javascript with Jasmine" />

> Jasmine suits for testing any piece of callable javascript
