---
title: Compiling Sass with Maven or Gulp
date: 2015-10-21T14:28:23
type: post
slug: compiling-sass-maven-gulp
cover: /images/featured/sass-logo-6.png
tags: ['css', 'maven', 'gulp', 'sass']
category: ['Web development']
author: jmtalarn
---

## Sass compiling from Maven

You can compile your sass css source files from your java projects build with maven with the **sass-maven-plugin**.
You can find the source code at GitHub <a href="https://github.com/Jasig/sass-maven-plugin" target="\_blank"> https://github.com/Jasig/sass-maven-plugin</a>, and find it on the Maven Central Repository.

> You should configure your maven pom file to properly use the plugin as needed.

<!--more-->

Add the plugin configuration in the `<plugins>` section of your pom.xml.

```xml
<plugin>
	<groupId>org.jasig.maven</groupId>
	<artifactId>sass-maven-plugin</artifactId>
	<version>1.1.0</version>
	<executions>
		<execution>
			<id>compilecss</id>
			<phase>prepare-package</phase>
			<goals>
				<goal>update-stylesheets</goal>
			</goals>
		</execution>
	</executions>
	<configuration>
		<resources>
			<resource>
				<source>
					<directory>
                    ${basedir}/src/main/resources/META-INF/resources/theme-location
                    </directory>
				</source>
				<destination>
                ${basedir}/src/main/resources/META-INF/resources/theme-location
                </destination>
			</resource>
		</resources>
	</configuration>
</plugin>
```

Maybe you want to prevent your .scss files to be copied in the final package compilation. Then you should add this kind of files in the exclude section inside the resources:

```xml
<resources>
	<resource>
		<directory>src/main/resources</directory>
		<includes>
			<include>**/theme.css</include>
			<include>**/images/*</include>
			<include>**/fonts/**/*</include>
			<include>**/template/**/*</include>
			<include>**/*.xml</include>
		</includes>
		<excludes>
			<exclude>**/*.scss</exclude>
		</excludes>
	</resource>
</resources>
```

Also if you need to edit and replace some of the content of the results you can use the Maven replacer plugin.
Then you need to configure it:

```xml
<plugin>
	<groupId>com.google.code.maven-replacer-plugin</groupId>
	<artifactId>replacer</artifactId>
	<version>1.5.3</version>
	<executions>
		<execution>
			<phase>prepare-package</phase>
			<goals>
				<goal>replace</goal>
			</goals>
		</execution>
	</executions>
	<configuration>
		<file>${basedir}/src/main/resources/META-INF/resources/primefaces-pnds/theme.css</file>
		<regex>false</regex>
		<replacements>
			<replacement>
				<token>"images/</token>
				<value>"#{resource['theme-location:images/</value>
			</replacement>
			<replacement>
				<token>.png"</token>
				<value>.png']}"</value>
			</replacement>
		</replacements>
	</configuration>
</plugin>
```

You don't need to install Sass separately because the Maven dependencies manager install all the requirements needed to do the compilation.

## Sass compiling from Gulp

In the same way if you are using Gulp to build an prepare your project you can compile your Sass files too.
In order to do this you need to use the **gulp-sass** https://www.npmjs.com/package/gulp-sass plugin in your Node.js project.
Installing Node.js is one of the requirements since you are using Gulp and you should think that gulp-sass like a wrapper of the required node module node-sass which uses internally the libsass library. The Node.js package system will install the requirements needed.

The module to add in the package.json file is gulp-sass and you can add to it with this line in the command-line from your project folder:

```bash

npm install gulp-sass --save-dev
```

Then you should configure a Gulp task to process your Sass files and compile them. This is an example about how to do it:

```javascript
var gulp = require('gulp')
var sass = require('gulp-sass')

gulp.task('sass', function() {
  gulp
    .src('./scss/*.scss')
    .pipe(sass())
    .pipe(gulp.dest('./css'))
})
```

And execute it with:

```bash

gulp sass
```

For sure you can complicate it as you want, concatenating the execution of the plugins and modules you need:

```javascript
gulp.task('site styles', function() {
  // For best performance, don't add Sass partials to `gulp.src`
  del(['.tmp'], function(err, deletedFiles) {
    console.log('Files deleted:', deletedFiles.join(', '))
  })
  return (
    gulp
      .src(['public/scss/*.scss'])
      .pipe($.sourcemaps.init())
      .pipe(
        $.changed('.tmp/styles', {
          extension: '.css',
        })
      )
      .pipe(
        $.sass({
          precision: 10,
          onError: console.error.bind(console, 'Sass error:'),
        })
      )
      .pipe(
        $.autoprefixer({
          browsers: AUTOPREFIXER_BROWSERS,
        })
      )
      .pipe($.sourcemaps.write())
      .pipe(gulp.dest('.tmp/styles'))
      // Concatenate and minify styles
      .pipe($.if('*.css', $.csso()))
      .pipe(gulp.dest('public/css'))
      .pipe(
        $.size({
          title: 'site styles',
        })
      )
  )
})
```
