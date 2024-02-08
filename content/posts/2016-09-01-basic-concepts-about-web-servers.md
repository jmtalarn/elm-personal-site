---
title: Basic concepts about web servers
date: 2016-09-01T00:03:00
type: post
slug: basic-concepts-about-web-servers
cover: /images/featured/web.jpg
category: ['Web development']
tags: ['web servers']
author: jmtalarn
---

When we talk about <strong>web server</strong> we are referring indistinctly to the software providing web content and the machine is running it.<br />
Generally a web server is a software providing web content to the clients connected to them, usually web browsers.<br />
This software is running listening on a <strong><a href="http://blog.jmtalarn.com/basic-concepts-about-web-servers/#port">port</a></strong> and when a client makes a request over the http protocol to a determined resource, usually via the <strong><a href="http://blog.jmtalarn.com/basic-concepts-about-web-servers/#methods">get method</a></strong>, it is sent to the client as response.
<!--more-->
So, the web server is accepting <strong><a href="http://blog.jmtalarn.com/basic-concepts-about-web-servers/#http">http</a></strong> <strong><a href="http://blog.jmtalarn.com/basic-concepts-about-web-servers/#request-response">requests</a></strong> and serving http <strong><a href="http://blog.jmtalarn.com/basic-concepts-about-web-servers/#request-response">responses</a></strong> which are tipically <strong><a href="http://blog.jmtalarn.com/basic-concepts-about-web-servers/#html">html</a></strong> documents. But these responses can also be text, images and practically any document type.<br />
All this resources are placed in a structure under the base server <strong><a href="http://blog.jmtalarn.com/basic-concepts-about-web-servers/#URL">URL</a></strong>, like if they were folders, and in many cases like the static servers is like this. The web server will be responsible to do the routing, also known as URL routing, from the resouce address to the correspondant content.</p>
<blockquote><p>The set of contents located on a web server is called a web site.</p></blockquote>
<p>A web server will be able to record in its logs data and information about any happening connection to server, statistics of usage and also any error that could happen during the process to elaborate and prepare the requests and the responses. All these information could be useful for web developers and webmasters to solve and detect incidents or users behaviours and tendences.<br />
And as final concepts to know about how the web server prepares the content to serve. The webserver sites can be static and/or dynamic. When a web site is static it means that all the content is already produced before it is requested. All the images, html documents and anything it serves already exists before the request. When a web site is dynamic it means that the response, or part of the response, is generated when it is requested and only exists after the request call.<br />
<a href="https://twitter.com/veltman">Noah veltman</a> explains it and compares the static web sites with vending machines and the dynamic web sites with restaurants in this article <a href="http://noahveltman.com/static-dynamic/">http://noahveltman.com/static-dynamic/</a></p>
<h4 id="sometermsusedabove">Some terms used above</h4>
<dl>
<dt id="http">http</dt>
<dd>Acronym for HyperText Transfer Protocol. This is the protocol used to transfer documents and media over the web. In fact, this is the foundations used to build the World Wide Web.<br />
We have to understand like the language and convention used to communicate the clients with the web servers. How the server resources can be requested, and how the messages of request and response should be.<br />
A web browser client usually only understand this protocol, and if you specify any other protocol not understood by the browser it will ask the operating system about which program would can open it.</dd>
<dt id="methods">methods</dt>
<dd>The HTTP protocol defines different methods to allow the webserver to interact with a resource in a different way depending on the method used. Together with the URL will be part of the request.<br />
These are:</p>
<ul>
<li>GET; is the common method to get the resource requested.</li>
<li>POST; this method is used to send information to the server in order to be processed and executed an action, normally pretending to create a resource.</li>
<li>PUT; this method also allows to send information but with the intention to be appened to thre requested resource.</li>
<li>DELETE; it is used with the intention to delete the resource</li>
<li>HEAD; this method will be used as if it was a GET method but the server will not return the body of the response.</li>
<li>OPTIONS; is used to check if the location is available and what it needs to be retrieved.</li>
<li>CONNECT; it pretends to establish a connection with a proxy.</li>
<li>TRACE; it should be used to get an echo message for the request send.</li>
</ul>
<p>Not all web servers will respond to all methods and not all the methods would work like are defined, because it depends on what is programmed in the server, especially in the dynamic sites and which methods are allowed.</dd>
<dt id="html">html</dt>
<dd>Acronym for Hypertext Markup Language,and this is the language, using a tagging format, of how are the basic web documents build. It's the source of any web page presented on a web server. It allows to embed images, video or audio as part of the document. The HTML, the CSS stylesheets and the javascript language used all together allow you to build anything you need based on the web from a simple welcome page to a complex Android or iOS app.</dd>
<dt id="URL">URL</dt>
<dd>Acronym of Uniform Resource Locator, and this is the specification where a resource is located on a server. Where a client, like a web browser, should make its request to get the resource needed. It is formed by a sequence like the following: <i>protocol</i>://<i>server name</i>[:<i>port</i>]/<i>path</i>/<i>for</i>/<i>the</i>/<i>resource</i>/<i>location</i>, defining the protocol to be used,<i>http</i> or <i>https</i> in the case of web server content, the server name, unique for the network where the client is connected, an optional port and followed for the concrete resource location</dd>
<dt id="port">port</dt>
<dd>is defined by an integer number from 0 to 65535. When we are talking about port we must understand it as a channel where our pc establish a connection to other machine. Is the channel where all communication will be performed. The first 1024 ports will be assigned to known protocols, like the 80 for web servers, and in spite of you can configure any port to use any protocol you are going to use, it is recommended to follow the preset numbers.</dd>
<dt id="request-response">request and response</dt>
<dd>Every time you ask for something to a web server you are performing a request, and as consequence of this request you'll get a response.<br />
When you are developing dynamic sites you have access to all the data sent on a request in order to build a response that the client can interpret. In a static site when you get a request it is automatically translated to a local resource and it is returned as the response, being these HTML documents or any other resource.<br />
If the request have different methods to ask for different behaviours over the server, the response has the status code. With this code, a numeric one, you can interpret the result as satisfactory or erroneous. Some of the most used codes are 200 to indicate a correct operation, 401 to unauthorized request, 404 for a resource not found, or 500 to indicate an error occurred on the server before sending the response. Here is a list with many more status codes <a href="https://en.wikipedia.org/wiki/List_of_HTTP_status_codes">https://en.wikipedia.org/wiki/List_of_HTTP_status_codes</a></dd>
</dl>
