---
title: Build and publish a Ionic App – Generate icon and splash images
date: "2017-10-07T02:32:34"
type: post
slug: build-publish-ionic-app-icon-splash-images
cover: /images/featured/splash.jpg
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

The icon is the first presentation of your app and maybe a bad design or a not so nice icon can make the user refuse to install your app. You should try to give a professional and nice presentation to, at least, avoid get the user away only at the first glance.

<!--more-->

The Ionic applications have two main assets which will be the visual presentation of your app. The framework provide a tool to generate all necessary files from the source images provided in your project. These files were'll be ready to be embedded on your final build and adapted to each size and requirement from the device.

<h3>Place your images on the resources folder</h3>
You should put your original images in the resources folder.

-   <h4>icon</h4>
     The first one, **the icon**, the typical clickable element on your device that will boot your application. It should be an image at least 1024 per 1024 pixels, called icon.png and placed on the resources folder. `resources/icon.png`

  <li>
      <h4>splash</h4>
      The **splash** image is the image used as presentation during the first boot waiting time. It should be an image at least 2732×2732px, called splash.png and placed on the resources folder. `resources/splash.png`

<h3>Execute command to generate resources</h3>

You only have to execute the following command to generate all necessary assets. Once generated you only have to build your application as usual and the procedure will get the needed images to generate the application.

```bash
$ ionic cordova resources
```

If you want to generate specifically only one target system you can specify a third parameter `ios` or `android`. Here [](https://ionicframework.com/docs/cli/cordova/resources) there is all the information about this command.

<h3>How to get good icons and images</h3>

The best option is always getting a professional doing that work. This can be an expensive option but there are many affordable options like **[Fiverr marketplace](http://track.fiverr.com/visit/?bta=16718&nci=5456)** full of professionals with a low price initial packs starting at **5$** or **[Envato Market](https://graphicriver.net/category/logo-templates?sort=price-asc&ref=jmtalarn)** where you can find logo templates from **6$** (formerly [http://graphicriver.net](https://graphicriver.net/?osr=tn&_ga=2.63050665.76736797.1507416297-993347448.1504486834&ref=jmtalarn) )

[![Fiverr link](http://fiverr.ck-cdn.com/tn/serve/?cid=415444)](http://track.fiverr.com/visit/?bta=16718&nci=5456)
[![Envato link](/images/envato-300x243.jpg)](https://graphicriver.net/category/logo-templates?sort=price-asc&ref=jmtalarn)

<h4>DIY resources</h4>
But if you're a friend of the [DIY](https://en.wikipedia.org/wiki/Do_it_yourself), as I am, you could find interesting the following resources.

-   **[Material Icon generator](https://android-material-icon-generator.bitdroid.de/)**. You can upload a custom svg file or use one from the default material icons collection to generate a nice rounded or squared materialized icon for your Android app.
    [](/images/material-icon-generator.png)

-   **[Pixabay](https://pixabay.com/)**. Thousands of images free to use, [Creative Commons](https://en.wikipedia.org/wiki/Creative_Commons_license) licensed.
    [](/images/pixabay-search.png)

And if after all, you dare to edit and modify by your own the assets I recommend these two, widely known, open source programs, included in all repositories of any Linux distro.

-   [Gimp icon](/images/icon-gimp.png)
    **GIMP**
    <blockquote>
    GIMP is a cross-platform image editor available for GNU/Linux, OS X, Windows and more operating systems. It is free software, you can change its source code and distribute your changes.
    Whether you are a graphic designer, photographer, illustrator, or scientist, GIMP provides you with sophisticated tools to get your job done. You can further enhance your productivity with GIMP thanks to many customization options and 3rd party plugins.
    </blockquote>
-   [Inkscape icon](/images/icon-inkscape.png)
    **Inkscape**
    <blockquote>Inkscape is an open-source vector graphics editor similar to Adobe Illustrator, Corel Draw, Freehand, or Xara X. What sets Inkscape apart is its use of Scalable Vector Graphics (SVG), an open XML-based W3C standard, as the native format.
    </blockquote>
