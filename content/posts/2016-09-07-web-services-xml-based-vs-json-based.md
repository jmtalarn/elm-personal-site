---
title: web services - xml based vs json based
date: "2016-09-07T19:14:50"
type: post
slug: web-services-xml-based-vs-json-based
cover: /images/featured/butler.jpg
category: ["Web development"]
tags: ["web services", "xml", "json"]
author: jmtalarn
---

When we talk about a **web services** we are referring to a software installed on a server with the function to provide a communication and interaction with other machines, acting as clients, using the posibilities that a web server can provide to communicate basically through the [HTTP protocol](http://blog.jmtalarn.com/basic-concepts-about-web-servers/#http).

<!--more-->

Many times the term can be mislead with many of the products that we can find on the Internet coming to your mind things like Gmail, Google Calendar, Twitter ... but technically it's incorrect. Web services will be the technology behind most of this services being these web applications the clients consuming the resource their web services are providing.

The web services provide a way of communication and they can be implemented using three common ways.

<h2 id="xmlrpc">XML-RPC</h2>
<h3 id="xmlremoteprocedurecall">XML Remote procedure call.</h3>

This method will send the data requesting the web service available call in a [xml](http://blog.jmtalarn.com/web-services-xml-based-vs-json-based/#xml) format. This xml information will contain the method to call and the parameters and its data type needed to perform the operation. This is an example

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

The data type should be one of the allowed as can be:

-   **_<string>_** to use for strings of characters
-   **_<boolean>_** A boolean true false value
-   **_<dateTime.iso8601>_** A date with the format represented
-   **_<double>_** Using double to represent decimal values
-   **_<int>_** or **_<i4>_** to represent integer values
-   **_<base64>_** Binary data encoded in base 64
-   **_<array>_** for arrays of the specified datatypes
-   **_<struct>_** for complex structures of data, using a key [tag](http://blog.jmtalarn.com/web-services-xml-based-vs-json-based/#tag) including the data type

After the request the server will answer with a response also in an xml format, like the following for the above request

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

Assuming that simple is because the calls will be always done in the same way being independent the way it's implemented. The messages sent and received are very similar to the XML-RPC ones because both are based with the xml format for the data. The SOAP protocol allows you to freely format the [request and response](http://blog.jmtalarn.com/basic-concepts-about-web-servers/#request-response) message when you are implementing and once the format is defined it should be shared with the client for an effective and satisfactory communication.

SOAP adds the concept of envelope to encapsulate the data.

This is an example of a request xml message:

```xml
<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
    <soap:Body>
        <getBookInfo xmlns="http://books.example.com/ws">
            <ISBNCode>8493376299</ISBNCode>
        </getBookInfo>
    </soap:Body>
</soap:Envelope>
```

And this the consequent response xml message:

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

This is a commonly way to implement a webservice to provide an [API](http://blog.jmtalarn.com/web-services-xml-based-vs-json-based/#api). Whilst the xml based protocols mentioned above relay on the message format to determine and configure the operation to execute the REST services are based on the [HTTP methods](http://blog.jmtalarn.com/basic-concepts-about-web-servers/#methods). There is no direct specification about how the data should be exchanged, that could be also [XML](http://blog.jmtalarn.com/web-services-xml-based-vs-json-based/#xml) or [JSON](http://blog.jmtalarn.com/web-services-xml-based-vs-json-based/#json), more common in this kind of web services. However to be defined as a pure RESTful service it should satisfy a list of requirements:

-   **_Client–server_** Clearly separated. The development of one doesn't affect the development of the other, independently while the interface between them isn't modified. The clients not concerned about the data storage and the servers not concerned about the user state.
-   **_Stateless_** Any client context won't be managed on the server between requests. Each request made by the clients will contain all the information necessary to service the request and the client will be responsible to manage the session.
-   **_Cacheable_** Saving calls always improve the performance. Unless is not explicitly defined by the server the responses could be cached to remove unnecessary interactions.
-   **_Layered system_** The system providing the web services could be composed by any necessary intermediary, as could be load balancers, shared caching systems or security providers.
-   **_Code on demand_** Optionally the servers could send to the client executable code.
-   **_Uniform interface_** The uniform interface will help to decouple the architecture between server and client, and this can happens thanks to follow the next principles:

-   **Identification of resources** Individual resources are identified in requests using [URIs](http://blog.jmtalarn.com/web-services-xml-based-vs-json-based/#uri) as resource identifiers.
-   **Manipulation of resources through representations** When a client get a representation of a resource, this representation is enough to call again the web service in order to modify or delete it.
-   **Self-descriptive messages** Each message includes enough information to describe how to process the message.
-   **Hypermedia as the engine of application state (HATEOAS)** The [Hypermedia](http://blog.jmtalarn.com/web-services-xml-based-vs-json-based/#hypermedia) will be all the client and the server need to know from each other. The clients will use the body content, the query parameters as strings the request headers and the requested URI (as the resource name). The service will send as response the body content, the http response code, and response headers.

<h4 id="sometermsusedabove">Some terms used above</h4>
<dl>
    <dt id="xml">xml</dt>
    <dd>Acronym of eXtensible Markup Language. An XML document is a document represented by a tree structure, being the root node the first element and hanging from it, like the tree branches, there will be the child elements. Any child element, could have child elements. Each node is formed by the element name, and also can have attributes with an optional value. Each node can contain data. The top line of a xml document, called XML prolog, can define the file containing the rules that the document format should follow. You can take a look of the syntax [here](http://www.w3schools.com/xml/xml_syntax.asp)
    </dd>
    <dt id="tag">tag</dt>
    <dd>A tag is the representation of a node in a xml document. It will be enclosed with &lt; and &gt; symbols. The elements can be closed in the same tag like this &lt;TAG/&gt; or using another tag to indicate the end of the element &lt;BLAH BLAH BLAH&gt;</dd>
    <dt id="json">JSON</dt>
        <dd>Acronym for JavaScript Object Notation, and is the way that the objects in the javascript programming languages are defined. This format is commonly used to serialize and send data from web services to clients and in the other way round.</dd>
    <dt id="api">API</dt>
        <dd>Acronym for Application Programming Interface and it refers to the specification of use for an application. By the way, in the webservices it will refer to the methods existing, the paremeters required and the response obtained.</dd>
    <dt id="uri">URI</dt>
        <dd>Acronym for Uniform resource Identifier, and it indicates the name of a resource with a string of characters. An [URL](http://blog.jmtalarn.com/basic-concepts-about-web-servers/#url) is a common form of URI to identify web resources.</dd>
    <dt id="hypermedia">Hypermedia</dt>
        <dd>Extending the hypertext concept, that is the text showed on the web with which the user can interact, to all the media involved in the hypertext documents.</dd>
</dl>
