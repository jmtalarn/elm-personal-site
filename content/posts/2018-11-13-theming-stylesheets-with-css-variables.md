---
title: Theming your stylesheets with css variables
date: 2018-11-13T12:50:12
type: post
slug: theming-stylesheets-with-css-variables
cover: /images/featured/css-variables.png
category: ["Web development"]
tags:
    [
        "variables",
        "web",
        "html",
        "css",
        "stylesheets",
        "javascript",
        "sass",
        "less",
        "css3",
    ]
author: jmtalarn
---

## What are CSS variables?

The CSS variables are more accurately known as CSS custom properties. You can define a value under a variable key and use it along your stylesheets wherever is in its scope.
They can be very useful to avoid CSS repetition, with a better performance in run time for things like theme switching and very useful for extending or 'polyfilling' future CSS features.

<!--more-->

Maybe you used or saw the use of variables in preprocessors like <a href="https://sass-lang.com/" target="_blank">Sass</a> or <a href="http://lesscss.org/" target="_blank">Less</a> but there are some differences in the use.
Unlike the way the variables are set and used in preprocessors which are only available in compilation time you can use the CSS custom properties during 'execution' time so the browser can update the things displayed accordingly the changes.

<a href="https://sass-lang.com/" class="card-preview" target="_blank">Sass</a>
<a href="http://lesscss.org/" class="card-preview" target="_blank">Less</a>

The CSS custom properties are currently defined as a candidate recommendation in the W3C.org

<a href="https://www.w3.org/TR/css-variables/" class="card-preview" target="_blank">W3C Custom properties</a>

But are widely implemented among the browsers and you're close to be sure to use them in your projects

<a href="https://www.caniuse.com/#search=css%20variables" class="card-preview" target="_blank">About custom properties in caniuse</a>

<h3>How to define CSS variables?</h3>
You can define the CSS variables inside any common CSS selector you are using in your stylesheets with a simple <code>--</code> following the css name for that variable and the value for that variable after the <code>:</code> property assignation.
As you are defining them into a CSS selector, the value will be applied in cascade in the same way any other property would apply. The value there will be defined there in the same way you declare any CSS property value.

A practical way to use it is making them accessible over all your stylesheet so you can define them into the root of the document using the <code>:root</code> pseudo element.

```css
:root {
	--your-color-variable-1: coral;
	--your-color-variable-2: blue;
	--your-border-default-setting: 1px solid black;
}
```

<h3>How to use CSS variables?</h3>
After your declaration you can use them inside the scope of the selector you defined it with the <code>var()</code> function, using as parameter the property in the same way you declared it (with the two preceding dashes).

As easy as this:

```css
.your-classname {
	color: var(--your-color-variable-1, "coral");
	border: var(--your-border-default-setting);
}
```

Note the second argument in the use of the <code>var</code> for the color property. You can provide there also a default value in case your variable is not defined yet. This can happen if, for example, you are setting it via Javascript after the first render of the web view

<h3>How to manipulate CSS variables?</h3>
After you set your variables you can manipulate it as you would do with the css properties in Javascript.

You can go by the style property of an element and use the <code>getPropertyValue</code> on that property to get the value as a String.

```javascript
element.style.getPropertyValue("--your-color-variable-1");
```

Also, you can get the computed style for an element using the <code>getComputedStyle</code> function available on the global <code>window</code> object and also use the <code>getPropertyValue</code> on the style object retrieved.

```javascript
getComputedStyle(element).getPropertyValue("--your-color-variable-1");
```

To set a CSS variable via Javascript you can use the setProperty method for the style object:

```javascript
element.style.setProperty("--your-color-variable-1", "#ff0000");
```

You should remember the value will apply on cascade so only will affect those elements in the scope of that declaration.

You can check the following embedded Codepen to see an example of how the values are changed via Javacript and the value applied on cascade:

<!-- <p data-height="720" data-theme-id="light" data-slug-hash="ERLRyO" data-default-tab="result" data-user="jmtalarn" data-pen-title="CSS Variables" class="codepen">See the Pen <a href="https://codepen.io/jmtalarn/pen/ERLRyO/">CSS Variables</a> by Joan Maria Talarn Espelta (<a href="https://codepen.io/jmtalarn">@jmtalarn</a>) on <a href="https://codepen.io">CodePen</a>.

<script async src="https://static.codepen.io/assets/embed/ei.js"></script> -->

<iframe height="300" style="width: 100%;" scrolling="no" title="CSS Variables" src="https://codepen.io/jmtalarn/embed/ERLRyO?default-tab=result" frameborder="no" loading="lazy" allowtransparency="true" allowfullscreen="true">
  See the Pen <a href="https://codepen.io/jmtalarn/pen/ERLRyO">
  CSS Variables</a> by Joan Maria Talarn Espelta (<a href="https://codepen.io/jmtalarn">@jmtalarn</a>)
  on <a href="https://codepen.io">CodePen</a>.
</iframe>

<h3>Theming your stylesheets</h3>
Once you know the basics of the CSS variables (AKA CSS Custom properties) you can use it as a powerful tool to declare CSS themes, without the need of complex stylesheet manipulation. You only need to identify recurrent properties you use in your CSS stylesheets, or those properties susceptibles to be changed depending on 
the theme like box shadows, text shadows or even the animations defined in your transitions properties.

After that a simple Javascript call to change the css variables on the root of the stylesheet will be enough to change it over all your site using them.

The values for your document root can be got from the computed style over your document body.

```javascript
const rootStyles = window.getComputedStyle(document.body);
let titleColor = rootStyles.getPropertyValue("--title-color").trim();

let subtitleColor = rootStyles.getPropertyValue("--subtitle-color").trim();
```

And after that you can set it as you want in a similar way as described before:

```javascript
const cssVar = "--title-color";
const newCssValue = "pink"; //or any other value you need to set
document.documentElement.style.setProperty(cssVar, newCssValue);
```
