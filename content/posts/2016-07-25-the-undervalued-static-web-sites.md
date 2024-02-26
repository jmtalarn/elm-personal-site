---
title: The undervalued static web sites
date: "2016-07-25T15:38:25"
type: post
slug: the-undervalued-static-web-sites
cover: /images/featured/Captura-de-pantalla-de-2016-07-08-13-00-25.png
category: ["Web development"]
tags: ["static web sites"]
author: jmtalarn
---

When you are going to build a new web site, most of times you go through it thinking about the technology you'll use to build it. Maybe you want to be on the cutting edge and you'll use the latest or rarest content management system like Ghost or maybe you'll use a wide extended system and full of available plugins (I've a mention about these later) like Wordpress.

<!--more-->

But only a few times we think about what we really want and what we really need.

Sometimes you're creating a new site that the content will not be much updated. The reason to choose one technology or another could be a client requirement but some of them also need external help to add or update the content, and many many times, his issues will be about changing themes or layouts and the professional help is a must.

This don't apply to everybody, but I'm sure that sometimes is like this.

You need to install a bunch of plugins to get what you really want, and maybe is useful for people without the technology knowledge but sometimes, this plugin will be an additional load for your site.

I don't mean to not use plugins, because some of them give you a lot of added value (the most actually useful are paid). But some other times the functionality could be added with a few lines of html or javascript and this amount of plugins are adding a lot of server backend computing.

<h2 id="advantagesofastaticwebsite">Advantages of a static web site.</h2>

A CMS needs to process the http request, then query the data to the database or external APIs and finally return all the stuff passing through the filters and plugins you could have installed. In the other hand, the static site only takes care of the first part of this sequence. A static site will respond to an http request with his static resources and sometimes will use calls to externals APIS.

After that, both send the information to the browser or http client and will be processed in the client to show what was required. Both kind of sites could take advantatge of the benefits of serving external assets from CDN repositories but ...

Finally this is translated in two important factors for the users expectations: **security and speed**. With a static site there is no need about managing security and user permissions, what is served from the server are static resources and there is no need to protect it if you are building a public site.

<h2 id="howtobuildstaticwebsite">How to build static web site.</h2>

Building a static site isn't about time travel and use technology of 10 years ago.

You can be in the wave of newer technologies like **Node.js**, **Grunt**, **Gulp**, **Sass**, **Handlebars** and all the mess of **npm** and **bower** packages ... and build fantastic static web sites and getting fun at the same time.

There are many options out there, but I tell which one I use. A framework that provides all together all the technologies I need: **Zurb Foundation** in the 6th version.

You can refer to the [documentation](http://foundation.zurb.com/) to see all options and possibilities to install and use the framework but I will provide a quick use guide

<h2 id="foundation-6-for-sites-quick-use-guide">Foundation 6 for sites: quick use guide</h2>

<h3 id="prerequisites">Pre-requisites</h3>

1. You have to install **_Node.js_** v0.12 or above. Refer to Node.js documentation for your OS [https://nodejs.org/en/download/](https://nodejs.org/en/download/)

2. Once you have installed Node.js you have to install _gulp_ and _bower_ globally executing with sudo if you are in Linux environment `sudo npm install -g gulp bower`

3. Git installed is also a requirement [https://git-scm.com/downloads](https://git-scm.com/downloads)

<h3 id="buildthesitetemplate">Build the site template</h3>

1. Install the _foundation-cli_ globally that will help you through the process to create a new site each time you need it (also with sudo if you are in Linux environment) `sudo npm install -g foundation-cli`
2. Create a working folder to set as your project development folder. Open a command line there or change to the working directory.
3. Execute the command `foundation new` to generate a new site with the cli in the working directory.
4. The assistant will ask you for 3 questions:
    1. The type of project you're building that is _A web site_ and this will use the _Foundation for Sites_ framework,
    2. the project name,
    3. and the template to generate the site skeleton.

I suggest to use the ZURB Template to use a set of tools that make the site development easier to structure content and modularize the components. These tools are basically the [Handlebars](http://handlebarsjs.com/) template system, that allows you to structure the HTML in a set of source files and the [Sass](http://sass-lang.com/) compiler to generate a resultant css from the source files with the help of some functions to manipulate the css generated and a modularized style of components.

```bash
? What are you building today? (Use arrow keys)
❯ A website (Foundation for Sites)
  A web app (Foundation for Apps)
  An email (Foundation for Emails)
```

```bash
? What's the project called? (no spaces) myproject
```

```bash
? Which template would you like to use?
  Basic Template: includes a Sass compiler
❯ ZURB Template: includes Handlebars templates and Sass/JS compilers
```

Finally we got a message thanking you to use the framework

```bash
            .
           /|     ,
      , /|/  \/| /|       Thanks for using ZURB Foundation for Sites!
     /|/       |/ |       -------------------------------------------
 |___|            |___|   Let's set up a new project.
 \___|  ^^   ^^   |___/   It shouldn't take more than a minute.
     | -[O]--[O]- |
     |    ___,    |
     |    ...     |
      \_ _ _ _ _ /


Downloading the project template...
Done downloading!

Installing dependencies...
```

And after the downloaded dependencies required to build the project it will show something like

```bash
You're all set!

 ✓ New project folder created.
 ✓ Node modules installed.
 ✓ Bower components installed.

Now run foundation watch while inside the myproject folder.
```

<h3 id="whatwegotandwhatiseachofthesefolders">What we got, and what is each of these folders?</h3>

```bash
.
├── bower_components
│   ├── foundation-sites
│   ├── jquery
│   ├── motion-ui
│   └── what-input
│ 
├── bower.json
├── CHANGELOG.md
├── config.yml
├── etc
├── gulpfile.babel.js
├── node_modules
│ 
├── package.json
├── readme.md
└── src
    ├── assets
    │   ├── img
    │   ├── js
    │   │   └── app.js
    │   └── scss
    │       ├── app.scss
    │       ├── components
    │       └── _settings.scss
    ├── data
    ├── layouts
    │   └── default.html
    ├── pages
    │   └── index.html
    ├── partials
    └── styleguide
        ├── index.md
        └── template.html
```

-   **bower_components** and **bower.json** You should install your bower dependencies in the root directory of your project. Here you can install things like [Font-Awesome](http://fontawesome.io/), [Moment](http://momentjs.com/) or [D3](https://d3js.org/) In the _bowercomponents_ folder there are the basic dependencies of the Zurb Foundation framework like [jQUery](https://jquery.com/)
-   **node_modules** folder contain the **Node.js** dependencies of the framework needed to generate the final files and folders to distribute as the site and **package.json** is the definition for _Node.js_ packages for the current site.
-   **gulpfile.babel.js** is the definition of the [gulp](http://gulpjs.com/) taks running the project. These tasks will use the configuration from the YAML file **config.yml**
-   **readme.md** A basic definition of how the project and the foundation cli rules.
-   **src** folder content are the fundamental elements of your site. Here is where you'll change things and generate the content of your website.

    -   **assets**

        -   **js** Any javascript file you want to include in your final code goes here
        -   **img** The folder to contain the image resources of your project
        -   **scss** It's containing the source files for all your custom styles as sass source files.

    -   **layouts** containing **default.html** which is the template for the general layout of the project in the Handlebars flavour
    -   **partials** Any piece of html (Handlebars) you reuse in many pages could go here in order to be accessible for any page.
    -   **pages** Each one of the pages in your site. Here you can set the folder and section structure you prefer. Also in Handlebars format.
    -   **styleguide** Is a content example using the defined styles as a showcase of the basic html components

<h3 id="runningit">Running it</h3>

<blockquote>
Run, change and review the result.
</blockquote>

You can run your project in a live server. This means that it will start a web server and will be listening to the changes in your project files like scss source files or html templates.

This is the command `foundation watch`

Once you have a statisfactory result you can generate the final files to upload to your production web server. These are the same content than the generated during the development but optimized to get a higher performance in the real life and use.

The command `foundation build` generates a **dist** folder containing the final result of your project.

<h3 id="updatingit">Updating it</h3>

You can run `npm update -g foundation-cli` to update the Foundation client.

Or if you want to update the package dependencies like the bower dependencies in your project you can run the command `foundation update`
