---
title: Build and publish a Ionic App – Generate icon and splash images
date: 2017-10-07T02:32:34
type: post
slug: build-publish-ionic-app-icon-splash-images
cover: /images/featured/splash.jpg
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

The icon is the first presentation of your app and maybe a bad design or a not so nice icon can make the user refuse to install your app. You should try to give a professional and nice presentation to, at least, avoid get the user away only at the first glance.

<!--more-->
<p>The Ionic applications have two main assets which will be the visual presentation of your app. The framework provide a tool to generate all necessary files from the source images provided in your project. These files were'll be ready to be embedded on your final build and adapted to each size and requirement from the device.</p>
<h3>Place your images on the resources folder</h3>
You should put your original images in the resources folder.
<ul>
  <li>
    <h4>icon</h4>
    The first one, <b>the icon</b>, the typical clickable element on your device that will boot your application. It should be an image at least 1024 per 1024 pixels, called icon.png and placed on the resources folder. <code>resources/icon.png</code>
  </li>
  <li>
      <h4>splash</h4>
      The <b>splash</b> image is the image used as presentation during the first boot waiting time. It should be an image at least 2732×2732px, called splash.png and placed on the resources folder. <code>resources/splash.png</code>
    </li>
</ul>

<h3>Execute command to generate resources</h3>
<p>
You only have to execute the following command to generate all necessary assets. Once generated you only have to build your application as usual and the procedure will get the needed images to generate the application.

```bash
$ ionic cordova resources
```

If you want to generate specifically only one target system you can specify a third parameter <code>ios</code> or <code>android</code>. Here <a href="https://ionicframework.com/docs/cli/cordova/resources/">https://ionicframework.com/docs/cli/cordova/resources/</a> there is all the information about this command.

</p>

<h3>How to get good icons and images</h3>
<p>
The best option is always getting a professional doing that work. This can be an expensive option but there are many affordable options like <a href="http://track.fiverr.com/visit/?bta=16718&nci=5456"><b>Fiverr marketplace</b></a> full of professionals with a low price initial packs starting at <strong>5$</strong> or <a href="https://graphicriver.net/category/logo-templates?sort=price-asc&ref=jmtalarn"><b>Envato Market</b></a> where you can find logo templates from <strong>6$</strong> (formerly <a href="https://graphicriver.net/?osr=tn&_ga=2.63050665.76736797.1507416297-993347448.1504486834&ref=jmtalarn">http://graphicriver.net</a>)</p>
<div style="display: flex; flex-wrap: wrap; align-items:center; justify-content: center;">
<a href="http://track.fiverr.com/visit/?bta=16718&nci=5456" Target="_Top" style="margin:1em;"><img border="0" src="http://fiverr.ck-cdn.com/tn/serve/?cid=415444"  width="300" height="250" style="margin:1em;"></a><a href="https://graphicriver.net/category/logo-templates?sort=price-asc&ref=jmtalarn" Target="_Top"><img border="0" src="../images/envato-300x243.jpg"  width="300" height="250"></a>
</div>
<h4>DIY resources</h4>
But if you're a friend of the <a href="https://en.wikipedia.org/wiki/Do_it_yourself">DIY</a>, as I am, you could find interesting the following resources.
<ul>
<li>
  <b><a href="https://android-material-icon-generator.bitdroid.de/">Material Icon generator</a></b>. You can upload a custom svg file or use one from the default material icons collection to generate a nice rounded or squared materialized icon for your Android app.
  <br>
  <img src="../images/material-icon-generator.png">
</li>
<li>
  <b><a href="https://pixabay.com/">Pixabay</a></b>. Thousands of images free to use, <a href="https://en.wikipedia.org/wiki/Creative_Commons_license">Creative Commons</a> licensed.
  <br>

  <img src="../images/pixabay-search.png">
</li>
</ul>
And if after all, you dare to edit and modify by your own the assets I recommend these two, widely known, open source programs, included in all repositories of any Linux distro.
<ul style="list-style: none;">
  <li>
    <img src="../images/icon-gimp.png" style="display: inline-block;">
      <b>GIMP</b>
        <blockquote>
        GIMP is a cross-platform image editor available for GNU/Linux, OS X, Windows and more operating systems. It is free software, you can change its source code and distribute your changes.
        Whether you are a graphic designer, photographer, illustrator, or scientist, GIMP provides you with sophisticated tools to get your job done. You can further enhance your productivity with GIMP thanks to many customization options and 3rd party plugins.
        </blockquote>
  </li>
  <li>
    <img src="../images/icon-inkscape.png" style="display: inline-block;">
      <b>Inkscape</b>
        <blockquote>Inkscape is an open-source vector graphics editor similar to Adobe Illustrator, Corel Draw, Freehand, or Xara X. What sets Inkscape apart is its use of Scalable Vector Graphics (SVG), an open XML-based W3C standard, as the native format.
        </blockquote>
  </li>
</ul>
