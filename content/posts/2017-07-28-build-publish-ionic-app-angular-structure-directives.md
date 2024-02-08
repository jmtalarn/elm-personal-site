---
title: 'Build and publish a Ionic App – Angular application structure: directives'
date: 2017-07-28T11:34:38
type: post
slug: build-publish-ionic-app-angular-structure-directives
cover: /images/featured/sign-post-2432209_1920.jpg
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

As we can create components like controllers, factories and services with code that can be reused in many parts of an AngularJs application, you could do the same by creating directives as reusable parts of code that applies to the HTML elements.
<!--more-->
So, as it is described in the definition of <a href="https://docs.angularjs.org/guide/directive">directive in the AngularJs documentation</a>, a directive is a marker in the DOM element that adds a new behaviour to the element or changes its default representation. The directives can be added as attributes or a css class in elements, properly as a new kind of element or even as a comment. AngularJs in the process to reinterpret all its tags and own directives in the HTML it will generate the new HTML corresponding to this modifications.</p>
<h2>Directives in the App</h2>
<p>In our <a href="http://blog.jmtalarn.com/build-publish-ionic-app-i-idea/">project</a> only created three <a href="https://github.com/jmtalarn/strikethru/blob/master/www/js/directives.js">directives</a>.</p>
<dl>
<dt>todoList</dt>
<dd>This is a directive created as an element. It will render the list and items and everywhere where it will be rendered it will have the same behaviour (swipe right to mark as done, swipe left to show the actions available.</dd>
<dt>growingTextarea</dt>
<dd>This directive is used as an attribute in the text areas elements. Where it applies it will watch for the length of the text and it will grow the height of the element as it is being written or will adapt to the content in the moment of the loading.</dd>
<dt>readMore</dt>
<dd>This is an element directive and it will render a paragraph with a limit of characters to show with a Read More link at the end if the underlying text is larger than the showed in the element. Once clicked it will expand the paragraph element in order to show the whole text and a link to shrink the component and hide part of the text.</dd>
</dl>
