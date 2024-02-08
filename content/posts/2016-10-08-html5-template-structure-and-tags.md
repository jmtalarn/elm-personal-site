---
title: HTML5 template - Structure and Tags
date: 2016-10-08T03:54:20
type: post
slug: html5-template-structure-and-tags
cover: /images/featured/html5-structure-tags.png
category: ['Web development']
tags: ['html5', 'semantic', 'tags']
author: jmtalarn
---

Take pen and paper and just write it on... or better take your favourite editor and create a new file.

## Basic structure.

The following declaration will declare the file you're writting as an HTML5 document.
<!--more-->


```html
<!DOCTYPE html>
```

<p>The document will be mainly composed with opening and closing tags declaring what is the contained inside the two tags.<br />
So an HTML document will be enclosed with an &lt;html&gt; tag and &lt;/html&gt; and inside the html block we should find two more blocks with &lt;head&gt; and &lt;/head&gt; where is placed information relative to the document and a block with &lt;body&gt; and &lt;/body&gt; where is placed the proper content of the document, this is the information will be shown (or not) in the document. You can set an information attribute in the html tag to specify the main language of the page content.</p>

```html
<html lang="en">
  <head> </head>
  <body></body>
</html>
```

<h2 id="comments">Comments</h2>
<p>A comment in an html document is described with &lt;!-- --&gt;. This will be rendered in the page source code but without any effect in the page displaying.</p>

```html
<!-- This is a comment -->;
```

<h2 id="theheadsection">The HEAD section</h2>
<p>The &lt;head&gt; &lt;/head&gt; section will include tags and elements that affect general information about the page. This can be relative to the general rendering of the browser for that page or meta information about the content in the page.</p>
<h3 id="title">TITLE</h3>
<p>This is the text that the browser will place on the top of the window when the page is opened. It's also the information identifying the page by default when you save it in your browser favourites.</p>

```html
<title>HTML5 page</title>
```

<h3 id="meta">META</h3>
<p>The tags META will let you add extra information about the page like the author, a short page description or the keywords that can be related when a search engine is examining your page in order to categorize the content.</p>

```html
<meta name="description" content="Sample page " />
<meta name="keywords" content="HTML5,Structure, tags" />
<meta name="author" content="jmtalarn" />
```

<p>You can also the characters encoding for the page with the charset meta, by default and recommended UTF-8. This is how the characters are written in the document to tell the browser how to have to read them.</p>

```html
<meta charset="UTF-8" />
```

<p>Some other informational meta tags that affect the browser behaviour are the following:</p>

```html
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
```

<p>The first indicates the Microsoft Internet Explorer browsers which grade of compatibility it should use to correct display page. <strong>I can tell you is like an impossible mission to achieve it 100% for versions previous to 11</strong><br />
The second with the viewport value is important for the responsiveness with mobile rendering because it sets the <em>width</em> of the viewport to the total device width available and the <em>initial-scale</em> property set the zoom level set when page loads.</p>
<p>In the &lt;head&gt; section of an html document you can also place references to an external stylesheet where there will be the CSS rules to properly display the content of the body.</p>

```html
<link href="/stylesheets/main.css" rel="stylesheet" />
```

<p>You can define the CSS rules directly in a &lt;style&gt; tag in any place, even in the &lt;body&gt;, but "the convention" recommends to let alone the content and its structure in the HTML file clean of displaying properties.</p>

```html
<style>
  div {
    border: 1px solid red;
  }
</style>
```

<p>You can also attach to the document files with Javascript code that will be executed during the rendering of the page.</p>

```html
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
```

<p>As with the styles, you can define the script directly inside &lt;script&gt; &lt;/script&gt; block. However the recommendation says to place the scripts inside and at the bottom of theelement due improvements in the load page times.</p>

```html
<script></script>
```

<p><span class="warning"><br />
Somewhere you'll see the script tag is decorated with a type attribute but actually this attribute is not really required because JavaScript is the default scripting language in HTML.</span></p>
<p>Finally you can set an favicon with the following tag. This is the small icon you can see in the browser aside the url input box.</p>

```html
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />
```

<h2 id="thebodysection">The BODY section</h2>
<p>In this section you'll place all the content displayed in a web page. To do this you have a large collection of tags with different uses.</p>
<h3 id="semanticelementsinbodycontent">Semantic elements in body content</h3>
<p>There is a collection of tags with nothing special while displaying but it helps you to understand about the content. Each of the following tags clearly define the purpose of the content as its internal structure. They can be repeated inside a document and they're not mandatory at all.<br />
These are some of the most common tags:</p>
<ul>
<li><strong>&lt;header&gt;&lt;/header&gt;</strong> Elements that compound a header</li>
<li><strong>&lt;nav&gt;&lt;/nav&gt;</strong> Navigation elements</li>
<li><strong>&lt;section&gt;&lt;/section&gt;</strong> As section divider inside the body or any other element</li>
<li><strong>&lt;main&gt;&lt;/main&gt;</strong> The main part of an element</li>
<li><strong>&lt;article&gt;&lt;/article&gt;</strong> Indicating an independent piece inside a document, like a blog or forum post or a newspaper article.</li>
<li><strong>&lt;aside&gt;&lt;/aside&gt;</strong> Something that complements an element, like a sidebar for the main content.</li>
<li><strong>&lt;footer&gt;&lt;/footer&gt;</strong> yes, for sure, elements that compound a footer</li>
</ul>
<p>The following two tags are also so important and presents in the html language<br />
almost since the beginning of time.</p>
<ul>
<li><strong>&lt;form&gt;&lt;/form&gt;</strong> Inside a form you can place a lot of elements like input boxes, text areas, checkboxes, select boxes... and is used generally to send data to be processed by the server. <span class="note">The form element deserves an exclusive post. </span></li>
<li><strong>&lt;table&gt;&lt;/table&gt;</strong> This is used to place tables in a page. And you can use the following to fill the table content
<ul>
<li><strong>&lt;thead&gt; &lt;/thead&gt;</strong>, <strong>&lt;tbody&gt; &lt;/tbody&gt;</strong> and <strong>&lt;tfoot&gt; &lt;/tfoot&gt;</strong> to set the header, the main content and the footer of the table respectively and not mandatory.</li>
</ul>
</li>
<li><strong>&lt;tr&gt; &lt;/tr&gt;</strong> Will be the rows and inside you can place:
<ul>
<li><strong>&lt;th&gt; &lt;/th&gt;</strong> For table header cells, in bold and centered text by default.</li>
<li><strong>&lt;td&gt; &lt;/td&gt;</strong> For table cells containing the data.<br />
Many times, if you dig in the source code of some web pages you can find that tables are used to make the layout of the page!<br />
<span class="warning">Is a bad practice to use tables for configure the layout of pages</span></li>
</ul>
</li>
</ul>

<h3 id="objecttagsandotherelements">Object tags and other elements</h3>
<p>There are a lot of other tags that can be used and ready to insert and embed other kind of media inside an html5 document. The use of these tags ousted the use of other technologies like the <strong>Java Applets</strong> or the <strong>Macromedia/Adobe Flash</strong> objects.</p>

<ul>
<li><strong>&lt;img src="../images/me.png"&gt;</strong> The images are an important element of the web.</li>
<li>**&lt;iframe src="<a href="http://www.google.es">http://www.google.es</a>"&gt;&lt;/iframe&gt; Allows you to embed another webpage in the frame defined with this tag.</li>
<li><strong>&lt;video&gt; &lt;/video&gt;</strong> Allows to embed videos and play them natively in the browser without the use of external plugins or software. Currently there are three video formats supported MP4, WebM, and Ogg</li>
<li><strong>&lt;audio&gt; &lt;/audio&gt;</strong> Same as video but to play audio files. Currently supported formats are MP3, Wav, and Ogg.</li>
<li><strong>&lt;svg&gt; &lt;/svg&gt;</strong> This tag allows you to draw directly vectorial graphics in the browser while it renders the document. You can use the content of the svg file to be embedded directly inside an html document.</li>
<li><strong>&lt;canvas&gt; &lt;/canvas&gt;</strong> The canvas is also used to draw graphics in the browser but in this case in execution time. The canvas is only a container for graphics and you must use a JavaScript to actually draw the graphics.</li>
</ul>

<p>This is a circle directly drew with the svg :</p>

```html
<svg width="100" height="100">
  <circle
    cx="50"
    cy="50"
    r="40"
    stroke="green"
    stroke-width="4"
    fill="yellow"
  />
</svg>
```

<h3 id="tldr">tl;dr</h3>
<p>Here is a generic HTML5 template document, using external resources like Bootstrap as css framework and jQuery:</p>

```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Title of the document</title>

    <meta name="description" content="Sample page " />
    <meta name="keywords" content="HTML5,Structure, tags" />
    <meta name="author" content="jmtalarn" />

    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Latest compiled and minified CSS -->
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
      integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
      crossorigin="anonymous"
    />

    <!-- Optional theme -->
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
      integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
      crossorigin="anonymous"
    />

    <!-- Latest compiled and minified JavaScript -->
    <script
      src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
      integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
      crossorigin="anonymous"
    ></script>
  </head>

  <body>
    <header><nav></nav></header>
    <main>
      <section>
        <aside></aside>
        <article></article>
      </section>
    </main>
    <footer></footer>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
  </body>
</html>
```
