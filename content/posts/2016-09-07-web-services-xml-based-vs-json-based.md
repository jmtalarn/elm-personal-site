---
title: web services - xml based vs json based
date: 2016-09-07T19:14:50
type: post
slug: web-services-xml-based-vs-json-based
cover: /images/featured/butler.jpg
category: ['Web development']
tags: ['web services', 'xml', 'json']
author: jmtalarn
---

When we talk about a <strong>web services</strong> we are referring to a software installed on a server with the function to provide a communication and interaction with other machines, acting as clients, using the posibilities that a web server can provide to communicate basically through the <a href="http://blog.jmtalarn.com/basic-concepts-about-web-servers/#http">HTTP protocol</a>.<!--more-->
<p>Many times the term can be mislead with many of the products that we can find on the Internet coming to your mind things like Gmail, Google Calendar, Twitter ... but technically it's incorrect. Web services will be the technology behind most of this services being these web applications the clients consuming the resource their web services are providing.</p>
<p>The web services provide a way of communication and they can be implemented using three common ways.</p>
<h2 id="xmlrpc">XML-RPC</h2>
<h3 id="xmlremoteprocedurecall">XML Remote procedure call.</h3>
<p>This method will send the data requesting the web service available call in a <a href="http://blog.jmtalarn.com/web-services-xml-based-vs-json-based/#xml">xml</a> format. This xml information will contain the method to call and the parameters and its data type needed to perform the operation. This is an example</p>

```xml
<?xml version="1.0"?>
<methodCall>
   <methodName>calculatethesum</methodName>
   <params>
      <param>
         <value><int>12500</int></value>
      </param>

      <param>
         <value><int>20480</int></value>
      </param>
   </params>
</methodCall>
```

<p>The data type should be one of the allowed as can be:</p>

<ul>
<li><strong><em><string></em></strong> to use for strings of characters</li>
<li><strong><em><boolean></em></strong> A boolean true false value</li>
<li><strong><em><dateTime.iso8601></em></strong> A date with the format represented</li>
<li><strong><em><double></em></strong> Using double to represent decimal values</li>
<li><strong><em><int></em></strong> or <strong><em><i4></em></strong> to represent integer values</li>
<li><strong><em><base64></em></strong> Binary data encoded in base 64</li>
<li><strong><em><array></em></strong> for arrays of the specified datatypes</li>
<li><strong><em><struct></em></strong> for complex structures of data, using a key <a href="http://blog.jmtalarn.com/web-services-xml-based-vs-json-based/#tag">tag</a> including the data type</li>
</ul>
<p>After the request the server will answer with a response also in an xml format, like the following for the above request</p>

```xml
<?xml version="1.0"?>
<methodResponse>
   <params>
      <param>
         <value><int>32980</int></value>
      </param>
   </params>
</methodResponse>
```

<h2 id="soap">SOAP</h2>
<h3 id="simpleobjectaccessprotocol">Simple Object Access Protocol.</h3>
<p>Assuming that simple is because the calls will be always done in the same way being independent the way it's implemented. The messages sent and received are very similar to the XML-RPC ones because both are based with the xml format for the data. The SOAP protocol allows you to freely format the <a href="http://blog.jmtalarn.com/basic-concepts-about-web-servers/#request-response">request and response</a> message when you are implementing and once the format is defined it should be shared with the client for an effective and satisfactory communication.<br />
SOAP adds the concept of envelope to encapsulate the data.<br />
This is an example of a request xml message:</p>

```xml
<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
    <soap:Body>
        <getBookInfo xmlns="http://books.example.com/ws">
            <ISBNCode>8493376299</ISBNCode>
        </getBookInfo>
    </soap:Body>
</soap:Envelope>
```

<p>And this the consequent response xml message:</p>

```xml
<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
    <soap:Body>
        <getBookInfoResponse xmlns="http://books.example.com/ws">
            <getBookInfoResult>
                <title>A Song of Ice and Fire</title>
                <author>George R.R. Martin</author>
                <publisher>Bantam Books</publisher>
            </getBookInfoResult>
        </getBookInfoResponse>
    </soap:Body>
</soap:Envelope>
```

<h2 id="rest">REST</h2>
<h3 id="representationalstatetransfer">REpresentational State Transfer.</h3>
<p>This is a commonly way to implement a webservice to provide an <a href="http://blog.jmtalarn.com/web-services-xml-based-vs-json-based/#api">API</a>. Whilst the xml based protocols mentioned above relay on the message format to determine and configure the operation to execute the REST services are based on the <a href="http://blog.jmtalarn.com/basic-concepts-about-web-servers/#methods">HTTP methods</a>. There is no direct specification about how the data should be exchanged, that could be also <a href="http://blog.jmtalarn.com/web-services-xml-based-vs-json-based/#xml">XML</a> or <a href="http://blog.jmtalarn.com/web-services-xml-based-vs-json-based/#json">JSON</a>, more common in this kind of web services. However to be defined as a pure RESTful service it should satisfy a list of requirements:</p>
<ul>
<li><strong><em>Client–server</em></strong> Clearly separated. The development of one doesn't affect the development of the other, independently while the interface between them isn't modified. The clients not concerned about the data storage and the servers not concerned about the user state.</li>
<li><strong><em>Stateless</em></strong> Any client context won't be managed on the server between requests. Each request made by the clients will contain all the information necessary to service the request and the client will be responsible to manage the session.</li>
<li><strong><em>Cacheable</em></strong> Saving calls always improve the performance. Unless is not explicitly defined by the server the responses could be cached to remove unnecessary interactions.</li>
<li><strong><em>Layered system</em></strong> The system providing the web services could be composed by any necessary intermediary, as could be load balancers, shared caching systems or security providers.</li>
<li><strong><em>Code on demand</em></strong> Optionally the servers could send to the client executable code.</li>
<li><strong><em>Uniform interface</em></strong> The uniform interface will help to decouple the architecture between server and client, and this can happens thanks to follow the next principles:
<ul>
<li><strong>Identification of resources</strong> Individual resources are identified in requests using <a href="http://blog.jmtalarn.com/web-services-xml-based-vs-json-based/#uri">URIs</a> as resource identifiers.</li>
<li><strong>Manipulation of resources through representations</strong> When a client get a representation of a resource, this representation is enough to call again the web service in order to modify or delete it.</li>
<li><strong>Self-descriptive messages</strong> Each message includes enough information to describe how to process the message.</li>
<li><strong>Hypermedia as the engine of application state (HATEOAS)</strong> The <a href="http://blog.jmtalarn.com/web-services-xml-based-vs-json-based/#hypermedia">Hypermedia</a> will be all the client and the server need to know from each other. The clients will use the body content, the query parameters as strings the request headers and the requested URI (as the resource name). The service will send as response the body content, the http response code, and response headers.</li>
</ul>
</li>
</ul>

<h4 id="sometermsusedabove">Some terms used above</h4>
<dl>
<dt id="xml">xml</dt>
<dd>Acronym of eXtensible Markup Language. An XML document is a document represented by a tree structure, being the root node the first element and hanging from it, like the tree branches, there will be the child elements. Any child element, could have child elements. Each node is formed by the element name, and also can have attributes with an optional value. Each node can contain data. The top line of a xml document, called XML prolog, can define the file containing the rules that the document format should follow. You can take a look of the syntax <a href="http://www.w3schools.com/xml/xml_syntax.asp">here</a></dd>
<dt id="tag">tag</dt>
<dd>A tag is the representation of a node in a xml document. It will be enclosed with < and > symbols. The elements can be closed in the same tag like this <TAG/> or using another tag to indicate the end of the element <TAG>BLAH BLAH BLAH</TAG></dd>
<dt id="json">JSON</dt>
<dd>Acronym for JavaScript Object Notation, and is the way that the objects in the javascript programming languages are defined. This format is commonly used to serialize and send data from web services to clients and in the other way round.</dd>
<dt id="api">API</dt>
<dd>Acronym for Application Programming Interface and it refers to the specification of use for an application. By the way, in the webservices it will refer to the methods existing, the paremeters required and the response obtained.</dd>
<dt id="uri">URI</dt>
<dd>Acronym for Uniform resource Identifier, and it indicates the name of a resource with a string of characters. An <a title="URL definition" href="http://blog.jmtalarn.com/basic-concepts-about-web-servers/#url">URL</a> is a common form of URI to identify web resources.</dd>
<dt id="hypermedia">Hypermedia</dt>
<dd>Extending the hypertext concept, that is the text showed on the web with which the user can interact, to all the media involved in the hypertext documents.</dd>
</dl>
