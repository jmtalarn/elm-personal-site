---
title: Running Node and React tests in the same project
date: "2019-07-24T12:50:02"
type: post
slug: running-node-js-react-tests-same-project
cover: /images/featured/nodejs-react-jest-tests.png
category: ["Web development"]
tags:
    [
        "testing",
        "web",
        "tdd",
        "unit tests",
        "jest",
        "react",
        "reactjs",
        "node",
        "nodejs",
        "javascript",
    ]
author: jmtalarn
---

# What is Jest?

Jest is a testing framework to run Javascript unit tests focused on the simplicity. It can work with Babel, Typescript and a wide set of frameworks like Angular, Vue, React as well as Node.js code.

<!--more-->

Another feature that does Jest really interesting is how fast is it as it is running tests on parallel and reorganize the execution of tests running first those who failed previously.
It comes with an easy to use API with a complete set of matchers to do any assert combination.
Also brings embedded a code coverage reporting tool and without adding anything else than a `--coverage` parameter in the execution command will show you the collected coverage information.

All together makes this testing framework an easy to configure option which covers most of the needs for unit testing.

It is used often to test React components and it comes configured by default in the projects created with [create-react-app scripts](https://facebook.github.io/create-react-app). But, as we read above, nothing prohibits you to use the same library to test any kind of Javascript code.

Is quite common to have just-in-one-place projects, with both frontend components and backend controllers or API maybe just separated by folders.
You can have a project with both React components in the frontend of the app and Node.js scripts in the backend providing your own API in the same application project.

> Jest can help you to test all together.

## Installing jest

Jest is package as a Node package and it can be installed in your project like any other npm module.

If you're using _npm_ command

```shell
npm install jest --save-dev
```

or if you are using _yarn_ command

```shell
yarn add -D jest
```

[Jest website](https://jestjs.io/")

## Generic and simple Jest configuration in your package.json

You can have a separate file specifically created for configuring Jest in your project, by default `jest.config.js` but also, this configuration can be placed in the same `package.json` of your project under the **"jest"** key property.

### Test files pattern

You should specify which will be the pattern for the files which will contain your test files. You can use the property **"testMatch"** and specify a glob pattern to get the files containing the tests.

### Environment

When you are configuring your project you can specify the type of environment the code is supposed to work. There is a property in the Jest configuration for that called **testEnvironment**

#### Browser environment

Your React components code is supposed to be running on the browser so your tests should behave like a browser would do. To specify that you have to set that property as _jsdom_ which will emulate the DOM tree generated on a browser <https://github.com/jsdom/jsdom>.

If the **testEnvironment** property is not provided this is the **default** environment for your Jest tests.

#### NodeJs environment

If you need to specify the environment for your backend code which is supposed to be running on a NodeJs instance you have to set the testEnvironment property as _node_.

## Backend code and frontend code in the same project

If we have both code in the same project you can configured two projects for the same jest configuration, specifying each project inside the property _"projects"_, where is the code itself and individually the pattern for your test files. Also you have to specify the kind of environment for each one of these.
All common jest configuration could be placed outside the _"projects"_ property and will be applied for all the projects set there.

## Supporting Babel in Jest

If you need to support [Babel](https://babeljs.io) you can add it to your project adding the needed libraries:

```shell
yarn add --dev babel-jest @babel/core @babel/preset-env
```

After that you can set up your Babel configuration. If you set it in your `package.json` file you should add it under the **"babel"** key property:

```json
 "babel": {
    "env": {
      "test": {
        "presets": ["env", "react"]
      }
    }
  },
```

## package.json

This is an example with frontend and backend in the same project. Backend is a Node.js with Express.js and the code is under the `api` folder, whilst the frontend code a React app created from create-react-app scripts is in `src` folder.

Check the following package.json with all the configuration commented above:

```json
{
	"name": "your-project",
	"version": "0.1.0",
	"private": true,
	"dependencies": {
		"cheerio": "^1.0.0-rc.2",
		"express": "^4.16.4",
		"react": "^16.6.1",
		"react-dom": "^16.6.1",
		"react-redux": "^5.1.0",
		"react-router-dom": "^4.3.1",
		"react-scripts": "2.1.1",
		"redux": "^4.0.1",
		"redux-cli-logger": "^2.1.0",
		"redux-logger": "^3.0.6",
		"redux-thunk": "^2.3.0"
	},
	"scripts": {
		"start": "concurrently \"node api/server\" \"react-scripts start\"",
		"build": "react-scripts build",
		"test": "jest",
		"eject": "react-scripts eject"
	},
	"proxy": "http://localhost:3001/",
	"eslintConfig": {
		"extends": "react-app"
	},
	"jest": {
		"verbose": true,
		"collectCoverageFrom": [
			"**/*.{js,jsx}",
			"!**/node_modules/**",
			"!**/*.test.js",
			"!**/coverage/**",
			"!**/serviceWorker.js",
			"!**/index.js"
		],
		"projects": [
			{
				"displayName": "backend",
				"testEnvironment": "node",
				"testMatch": ["<rootDir>/api/**/*.test.js"]
			},
			{
				"displayName": "frontend",
				"testEnvironment": "jsdom",
				"testMatch": ["<rootDir>/src/**/*.test.js"],
				"moduleFileExtensions": ["js", "json"],
				"moduleNameMapper": {
					"\\.(jpg|jpeg|png|gif|eot|otf|webp|svg|ttf|woff|woff2|mp4|webm|wav|mp3|m4a|aac|oga)$": "<rootDir>/__mocks__/fileMock.js",
					"\\.(css|less)$": "<rootDir>/__mocks__/styleMock.js"
				}
			}
		]
	},
	"babel": {
		"env": {
			"test": {
				"presets": ["env", "react"]
			}
		}
	},
	"browserslist": [">0.2%", "not dead", "not ie <= 11", "not op_mini all"],
	"devDependencies": {
		"babel-core": "^6.26.3",
		"babel-jest": "^23.6.0",
		"babel-preset-env": "^1.7.0",
		"babel-preset-react": "^6.24.1",
		"concurrently": "^4.0.1",
		"jest": "^23.6.0",
		"react-test-renderer": "^16.6.1",
		"supertest": "^3.3.0"
	}
}
```
