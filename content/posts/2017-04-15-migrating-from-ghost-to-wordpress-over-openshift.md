---
title: Migrating from Ghost to WordPress over Openshift
date: 2017-04-15T00:51:09
type: post
slug: migrating-from-ghost-to-wordpress-over-openshift
cover: /images/featured/wp-vs-ghost.jpg
category: ['Blogging', 'Web development']
tags: ['blog', 'blogging', 'ghost', 'wordpress', 'openshift']
author: jmtalarn
---

Until now, I was blogging using Ghost platform over Openshift. I love the way you develop new features over the Ghost platform: Handlebars for the templating, an easy API to get information about the blog and their posts... and you are using the Node.js on the backend so you're feeling a little bit hipster while you're using it.<!--more-->
But the last update of the platform over Openshift was a really pain trying to update it with no success. After some hours after, I decided to sadly abandon the Ghost and migrate everything to Wordpress.</p>
<p><img  src="../images/CMS-technologies-Web-Usage-Statistics-300x229.png" alt="" /> CMS usage statistics https://trends.builtwith.com/cms</p>
<p>Wordpress is the most used CMS/Blogging platform. There is a huge documentation about how to use and develop over it and countless plugins and themes free and paid to try and use. Easy to use but not so easy to develop or trick the themes as it was with Ghost. Even so I have to admit it, <strong>Wordpress rocks</strong>!</p>
<h1>Installing Wordpress on Openshift</h1>
<p>Simply a click on the Wordpress option. No need to specify any git url for the project, it's all included and mantained with autoupdates by the Wordpress itself.<br />
Click the Add application ... button and in the next screen search for Wordpress.</p>
<p><img class="alignnone size-medium" src="../images/Create-a-New-Application-_-OpenShift-Online-by-Red-Hat-300x196.png" alt="" /></p>
<p>Everything will be installed and auto configured, ready to use.</p>
<h1>Importing posts and media from Ghost blog to Wordpress blog</h1>
<p>Importing the data is the most important. You don't want to loose your work in the process so you should be carefully...</p>
<p>For sure you can do an export/import operation. You can export the data of your Ghost blog from <em><strong>Settings &gt; Labs &gt; Export</strong></em> button, this will return a json file. The data in json format should be transformed into a format readable by Wordpress in order to be imported with the <em><strong>Tools &gt; Import &gt; Wordpress</strong></em> option.  You can use a tool like <a href="http://ahmed.amayem.com/ghost-json-export-file-to-wordpress-xml-import-file-converter/">http://ahmed.amayem.com/ghost-json-export-file-to-wordpress-xml-import-file-converter/</a> to do the transformation but you have to be sure that all url references are correct linking to existing media ...</p>

<p>Another option, which I preferred to use in this case, is using the <em><strong>Tools &gt; Import &gt; Rss</strong></em> option. I took the Ghost blog rss url (usually http://your-ghost-blog/rss ) to import the published posts. All posts where correctly imported keeping the HTML final format, but all media whas pointing to the Ghost blog media resources. So the next step is import the media.</p>
<h1>Import external media into your Wordpress media gallery</h1>
<p>The plugin used was <a href="https://wordpress.org/plugins/auto-upload-images/">Auto Upload Images By Ali Irani </a></p>
<p><img  src="../images/Auto-Upload-Images-Settings-&#8249;-web-dev-notes-&#8212;-WordPress-293x300.png" alt="" /> Auto upload images settings</p>
<p>This plugin takes the media linked on the post and autoupload it to Wordpress Gallery when you save the post. This means you need to edit all posts, but you can do it easily with the bulk edit option in Wordpress.</p>
<p><img  src="../images/Bulk-edit-Posts-&#8249;-web-dev-notes-&#8212;-WordPress-300x191.png" alt="" /> Bulk editing posts on WordPress</p>
<p>After these easy steps you will have all your content published on Ghost blog into your Wordpress installation.</p>
