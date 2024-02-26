---
title: One source of truth to run them all
date: "2020-04-06T13:10:19"
type: post
slug: one-source-of-truth-for-all-Redux-javascript-components
cover: /images/featured/one-ring-to-run-them-all.png
category: ["Web development"]
tags:
    [
        "web",
        "react",
        "reactjs",
        "vue",
        "vuejs",
        "javascript",
        "elm",
        "svelte",
        "angular",
        "angularjs",
        "web components",
        "components",
        "Redux",
        "webpack",
    ]
author: jmtalarn
---

This is an example of how different components implemented with different frontend frameworks or libraries can share the same _Redux_ store.

### Different frameworks and libraries in same project

The idea of the project is to implement the same component, a simple counter with two buttons, one to increase the value and other to decrease it.
I decided to go with Webpack to build and bundle everything.
Webpack has a large set of plugins and my thought was that there should be a loader in case I need it to load and build the resources. (I was right as I could check it)

<!--more-->

Even this have a so little efficiency this could make sense if you imagine several teams working on specific business areas with different responsabilities working on the frontend. Each one can work with an specific component or widget depending on the business they are in charge and they choose they preferred library or framework to implement it but they share the same store to manage the general state of the application.

## Common Redux store and actions

Then I put myself hands on this and started thinking how to do it. First I decided to use a Redux store to share the state of the frontend application. All components would need a common state with shared (or not) information as well as which actions they need to run. Redux is a well known solution and wide used and finally is just a Javascript library so it could be easy to integrate with all the components coded for a web application as finally all code executed in the web browser is Javascript and it can be used in a way or another.

[Redux](https://redux.js.org/)

The Redux store is created or referenced in the main index.js file. It is created not belonging to any library component or framework and I just have to find the way to share the current state (the counter value) and the actions which triggers the increment and decrement.

[Learn Redux](https://pluralsight.pxf.io/mdqK1)

### Javascript

![Javascript][logo_javascript]
Javascript is the language for the web and anything that can be implemented in any framework or library will be transpiled at some point to a Javascript piece of code. So, anything can be done with the bare language.

[Learn Javascript](https://pluralsight.pxf.io/5JEEN)

#### Implementation

The component writes the convenient HTML in the component container and binds the actions increment and decrement directly to the onclick events of the buttons accordingly. The connect function adds a subcriber to the store changes and passes it to a render method which is in charge of change the content of the counter. Easy and simple to implement.

#### Valoration

> I'm really used to work with the language as I'm working with React and Node.js in my day to day job. Redux is a simple javacript library and the connection with the state and the actions is quite straightforward.
> <easy-like-score easiness="5" likeness="5" />

---

### React

![React][logo_react]
React is a library with the main target of components development.

[Learn React](https://pluralsight.pxf.io/VX99E)

#### Implementation

Implementing the component is quite straightforward. Also each time a property passed to the component changes it triggers the re-render of the component. The connection is quite easy as there is a react-Redux library to make easier the connection between the Redux store and the component.

#### Valoration

> I am used to React library and I really like it the filosofy of the Component composition of it. Also React has a library to connect to Redux so the connection was really easy to implement.
> <easy-like-score easiness="4" likeness="5" />

---

### Vue

![Vue][logo_vue]
Vue is a that has a great community behind. It started as an evolution of AngularJs taking the good things about this "oldie" framework and added and improved everything. This library/framework is still growing and improving.

[Learn Vue](https://pluralsight.pxf.io/ZW55k)

#### Implementation

Just added a Vue loader into the Webpack project to load .vue extension files as Vue components.
The Redux binding is done as easy is done in React components with a wrapped component using the `vue-redux-connect` library which is in charge to connect properties and methods from store..

#### Valoration

> This was my first approach to implement anything with Vue. As I saw there are many ways to create the component and I found one that fitted quite well with the project. You can create a component in just one file where you can place the markup template, styling and internal code.
> <easy-like-score easiness="4" likeness="4" />

---

### Elm

![Elm][logo_elm] Elm is a programming language that brings the **functional paradigm** to the frontend development. Using the Elm libraries you can forgot about CSS, JS and HTML to get things done but you have to learn a **new language**.

[Learn Elm](https://pluralsight.pxf.io/odDDm)

#### Implementation

Elm lives in its own world inside the web page but it has mechanisms to "comunicate" with the dangerous area so you can pass properties and methods to it.

#### Valoration

> I really love 💚 Elm. I would like to switch to this language if not completetly but enough to be my main job as developer. The compiler is so helpful and not just for Syntax errors, but suggests you what you can do to solve it... continuously... until it compiles. That, instead of increase the learning curve, makes the work of develop with this language pleasant. Also, as there are no colateral effects if it compiles, means it works. Testing is implicit in the development.
> <easy-like-score easiness="4" likeness="5" />

---

### WebComponents

![WebComponents][logo_wc]
Web components is a proposal to be a standard in the way of how to create web components (forgive the redundancy)

[Learn Web Components](https://pluralsight.pxf.io/ndxKX)

#### Implementation

Creating a component is done by creating a Javascript class extending an HTMLElement. In this HTMLElement you have many lifecycle methods where you can do your stuff. In this case I used `attributeChangedCallback` to detect when the atribute with the count value is updated from state and `connectedCallback` where once the component is mounted on the DOM I attach the listeners from the buttons to the methods passed as properties. As Web components are just like new elements ready to be added to the html page, the connection to the store is done like it is done in the Pure Javascript component.

#### Valoration

> Until it's not a completely supported standard there are more easy/effective ways to create web components. It was not hard to implement and bind but eventhough I think is a standard that is getting more acceptance to develop shared and common library componets between projects.
> <easy-like-score easiness="4" likeness="3" />

---

### Svelte

![Svelte][logo_svelte]
Svelte is a new framework to build web components that compiles to plain Javascript. This compilation step implies that the final bundled code will be light and highly efficient.

[Learn Svelte](https://pluralsight.pxf.io/31WKd)

#### Implementation

Svelte requires to add a loader also in Webpack config. This will load the compoenent and build it accordingly. The Svelte file while contain three sections, one `<script>` for the script executed there, basically declaring the variable to be showed in the template, and the methods to run on the on click events, the `<style>` section which will include the individual styles for the component and finally the template used for the component. Nothing so much different from a regular html file, just you will have there the specificics of Svelte for the binding there. Then the connection with the store is done by creating a `DocumentFragment`in which will create the new Svelte component passing the actions to increment and decrement and the binding to he count value. Here we also subscribe to the count store value change to set it and change the Svelte component property.

#### Valoration

> It was my first approach to this library and I wasn't disapointed. Easy to implement and great documentation supporting it. Maybe it will have a great future in the web components development scene.
> <easy-like-score easiness="4" likeness="4" />

---

### Angular

![Angular][logo_angular]
Angular is a complete framework to build frontend web applications, it derives initially from the AngularJs library but it is a complete new different thing. It started as Angular 2 and in the moment to write this post reached the 9th version of the library.

[Learn Angular](https://pluralsight.pxf.io/4V07o)

#### Implementation

First, Angular uses Typescript so I had to add support to it to the webpack project adding the `ts-loader` for .ts files. Then Angular requires a more complex structure so I need to add a file for the component itself (template, styles and buttons behaviour), another file for what is called a module which will be "compiled" into an Angualr application, and separately the injectable actions (increment and decrement actions). An additional module helped into binding the value from the store to the counter.

#### Valoration

> As Angular is a whole framework and everything is easier if you use Angular CLI from the scratch to create, build and bootstrap of a whole application. As my intention was to introduce it into an existing project it took me quite a bit to make it work. Also even I used a third-party library to connect it to Redux it was not easy as it was in other components.
> <easy-like-score easiness="2" likeness="1" />

---

### AngularJs

![AngularJs][logo_angularjs]
Angularjs is one of the first frameworks that appeared on the frontend development and it was like the starter of this great moment is living the web development. Is the predecessor of Angular but both of them are not related at all.

[Learn AngularJs](https://pluralsight.pxf.io/NaWx2)

#### Implementation

I created the template of the component in a separate file loaded in the connect functions with binds it to the store and actions as it needs to be binded when you're creating the Angularjs application

#### Valoration

> AngularJs was the first framework I used working intensively in the frontend but I almost forgot everything :D and after retaking the concepts of the framework I can tell there are easier ways to work for the web frontend. It was not so hard to implement it but still, the way to connect it and make it work with the shared state is not of my taste at all.
> <easy-like-score easiness="2" likeness="2" />

---

### Links

-   [Github repo link](https://github.com/jmtalarn/standalone-store)
-   [Live demo](https://jmtalarn.github.io/standalone-store/)

[logo_javascript]: data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCA2MzAg%0D%0ANjMwIj4KPHJlY3Qgd2lkdGg9IjYzMCIgaGVpZ2h0PSI2MzAiIGZpbGw9IiNmN2RmMWUiLz4KPHBh%0D%0AdGggZD0ibTQyMy4yIDQ5Mi4xOWMxMi42OSAyMC43MiAyOS4yIDM1Ljk1IDU4LjQgMzUuOTUgMjQu%0D%0ANTMgMCA0MC4yLTEyLjI2IDQwLjItMjkuMiAwLTIwLjMtMTYuMS0yNy40OS00My4xLTM5LjNsLTE0%0D%0ALjgtNi4zNWMtNDIuNzItMTguMi03MS4xLTQxLTcxLjEtODkuMiAwLTQ0LjQgMzMuODMtNzguMiA4%0D%0ANi43LTc4LjIgMzcuNjQgMCA2NC43IDEzLjEgODQuMiA0Ny40bC00Ni4xIDI5LjZjLTEwLjE1LTE4%0D%0ALjItMjEuMS0yNS4zNy0zOC4xLTI1LjM3LTE3LjM0IDAtMjguMzMgMTEtMjguMzMgMjUuMzcgMCAx%0D%0ANy43NiAxMSAyNC45NSAzNi40IDM1Ljk1bDE0LjggNi4zNGM1MC4zIDIxLjU3IDc4LjcgNDMuNTYg%0D%0ANzguNyA5MyAwIDUzLjMtNDEuODcgODIuNS05OC4xIDgyLjUtNTQuOTggMC05MC41LTI2LjItMTA3%0D%0ALjg4LTYwLjU0em0tMjA5LjEzIDUuMTNjOS4zIDE2LjUgMTcuNzYgMzAuNDUgMzguMSAzMC40NSAx%0D%0AOS40NSAwIDMxLjcyLTcuNjEgMzEuNzItMzcuMnYtMjAxLjNoNTkuMnYyMDIuMWMwIDYxLjMtMzUu%0D%0AOTQgODkuMi04OC40IDg5LjItNDcuNCAwLTc0Ljg1LTI0LjUzLTg4LjgxLTU0LjA3NXoiLz4KPC9z%0D%0Admc+
[logo_react]: data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNDk1IiBoZWlnaHQ9IjQ0MCIgdmlld0JveD0iMCAwIDQ5NSA0NDAiIA0KCXht%0D%0AbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+DQoJPHBhdGggaWQ9InN2Z18yIiBkPSJt%0D%0ANDkzLjMsMjIwLjVjMCwtMzIuNSAtNDAuNywtNjMuMyAtMTAzLjEsLTgyLjRjMTQuNCwtNjMuNiA4%0D%0ALC0xMTQuMiAtMjAuMiwtMTMwLjRjLTYuNSwtMy44IC0xNC4xLC01LjYgLTIyLjQsLTUuNmwwLDIy%0D%0ALjNjNC42LDAgOC4zLDAuOSAxMS40LDIuNmMxMy42LDcuOCAxOS41LDM3LjUgMTQuOSw3NS43Yy0x%0D%0ALjEsOS40IC0yLjksMTkuMyAtNS4xLDI5LjRjLTE5LjYsLTQuOCAtNDEsLTguNSAtNjMuNSwtMTAu%0D%0AOWMtMTMuNSwtMTguNSAtMjcuNSwtMzUuMyAtNDEuNiwtNTBjMzIuNiwtMzAuMyA2My4yLC00Ni45%0D%0AIDg0LC00Ni45bDAsLTIyLjNjMCwwIDAsMCAwLDBjLTI3LjUsMCAtNjMuNSwxOS42IC05OS45LDUz%0D%0ALjZjLTM2LjQsLTMzLjggLTcyLjQsLTUzLjIgLTk5LjksLTUzLjJsMCwyMi4zYzIwLjcsMCA1MS40%0D%0ALDE2LjUgODQsNDYuNmMtMTQsMTQuNyAtMjgsMzEuNCAtNDEuMyw0OS45Yy0yMi42LDIuNCAtNDQs%0D%0ANi4xIC02My42LDExYy0yLjMsLTEwIC00LC0xOS43IC01LjIsLTI5Yy00LjcsLTM4LjIgMS4xLC02%0D%0ANy45IDE0LjYsLTc1LjhjMywtMS44IDYuOSwtMi42IDExLjUsLTIuNmwwLC0yMi4zYzAsMCAwLDAg%0D%0AMCwwYy04LjQsMCAtMTYsMS44IC0yMi42LDUuNmMtMjguMSwxNi4yIC0zNC40LDY2LjcgLTE5Ljks%0D%0AMTMwLjFjLTYyLjIsMTkuMiAtMTAyLjcsNDkuOSAtMTAyLjcsODIuM2MwLDMyLjUgNDAuNyw2My4z%0D%0AIDEwMy4xLDgyLjRjLTE0LjQsNjMuNiAtOCwxMTQuMiAyMC4yLDEzMC40YzYuNSwzLjggMTQuMSw1%0D%0ALjYgMjIuNSw1LjZjMjcuNSwwIDYzLjUsLTE5LjYgOTkuOSwtNTMuNmMzNi40LDMzLjggNzIuNCw1%0D%0AMy4yIDk5LjksNTMuMmM4LjQsMCAxNiwtMS44IDIyLjYsLTUuNmMyOC4xLC0xNi4yIDM0LjQsLTY2%0D%0ALjcgMTkuOSwtMTMwLjFjNjIsLTE5LjEgMTAyLjUsLTQ5LjkgMTAyLjUsLTgyLjN6bS0xMzAuMiwt%0D%0ANjYuN2MtMy43LDEyLjkgLTguMywyNi4yIC0xMy41LDM5LjVjLTQuMSwtOCAtOC40LC0xNiAtMTMu%0D%0AMSwtMjRjLTQuNiwtOCAtOS41LC0xNS44IC0xNC40LC0yMy40YzE0LjIsMi4xIDI3LjksNC43IDQx%0D%0ALDcuOXptLTQ1LjgsMTA2LjVjLTcuOCwxMy41IC0xNS44LDI2LjMgLTI0LjEsMzguMmMtMTQuOSwx%0D%0ALjMgLTMwLDIgLTQ1LjIsMmMtMTUuMSwwIC0zMC4yLC0wLjcgLTQ1LC0xLjljLTguMywtMTEuOSAt%0D%0AMTYuNCwtMjQuNiAtMjQuMiwtMzhjLTcuNiwtMTMuMSAtMTQuNSwtMjYuNCAtMjAuOCwtMzkuOGM2%0D%0ALjIsLTEzLjQgMTMuMiwtMjYuOCAyMC43LC0zOS45YzcuOCwtMTMuNSAxNS44LC0yNi4zIDI0LjEs%0D%0ALTM4LjJjMTQuOSwtMS4zIDMwLC0yIDQ1LjIsLTJjMTUuMSwwIDMwLjIsMC43IDQ1LDEuOWM4LjMs%0D%0AMTEuOSAxNi40LDI0LjYgMjQuMiwzOGM3LjYsMTMuMSAxNC41LDI2LjQgMjAuOCwzOS44Yy02LjMs%0D%0AMTMuNCAtMTMuMiwyNi44IC0yMC43LDM5Ljl6bTMyLjMsLTEzYzUuNCwxMy40IDEwLDI2LjggMTMu%0D%0AOCwzOS44Yy0xMy4xLDMuMiAtMjYuOSw1LjkgLTQxLjIsOGM0LjksLTcuNyA5LjgsLTE1LjYgMTQu%0D%0ANCwtMjMuN2M0LjYsLTggOC45LC0xNi4xIDEzLC0yNC4xem0tMTAxLjQsMTA2LjdjLTkuMywtOS42%0D%0AIC0xOC42LC0yMC4zIC0yNy44LC0zMmM5LDAuNCAxOC4yLDAuNyAyNy41LDAuN2M5LjQsMCAxOC43%0D%0ALC0wLjIgMjcuOCwtMC43Yy05LDExLjcgLTE4LjMsMjIuNCAtMjcuNSwzMnptLTc0LjQsLTU4Ljlj%0D%0ALTE0LjIsLTIuMSAtMjcuOSwtNC43IC00MSwtNy45YzMuNywtMTIuOSA4LjMsLTI2LjIgMTMuNSwt%0D%0AMzkuNWM0LjEsOCA4LjQsMTYgMTMuMSwyNGM0LjcsOCA5LjUsMTUuOCAxNC40LDIzLjR6bTczLjks%0D%0ALTIwOC4xYzkuMyw5LjYgMTguNiwyMC4zIDI3LjgsMzJjLTksLTAuNCAtMTguMiwtMC43IC0yNy41%0D%0ALC0wLjdjLTkuNCwwIC0xOC43LDAuMiAtMjcuOCwwLjdjOSwtMTEuNyAxOC4zLC0yMi40IDI3LjUs%0D%0ALTMyem0tNzQsNTguOWMtNC45LDcuNyAtOS44LDE1LjYgLTE0LjQsMjMuN2MtNC42LDggLTguOSwx%0D%0ANiAtMTMsMjRjLTUuNCwtMTMuNCAtMTAsLTI2LjggLTEzLjgsLTM5LjhjMTMuMSwtMy4xIDI2Ljks%0D%0ALTUuOCA0MS4yLC03Ljl6bS05MC41LDEyNS4yYy0zNS40LC0xNS4xIC01OC4zLC0zNC45IC01OC4z%0D%0ALC01MC42YzAsLTE1LjcgMjIuOSwtMzUuNiA1OC4zLC01MC42YzguNiwtMy43IDE4LC03IDI3Ljcs%0D%0ALTEwLjFjNS43LDE5LjYgMTMuMiw0MCAyMi41LDYwLjljLTkuMiwyMC44IC0xNi42LDQxLjEgLTIy%0D%0ALjIsNjAuNmMtOS45LC0zLjEgLTE5LjMsLTYuNSAtMjgsLTEwLjJ6bTUzLjgsMTQyLjljLTEzLjYs%0D%0ALTcuOCAtMTkuNSwtMzcuNSAtMTQuOSwtNzUuN2MxLjEsLTkuNCAyLjksLTE5LjMgNS4xLC0yOS40%0D%0AYzE5LjYsNC44IDQxLDguNSA2My41LDEwLjljMTMuNSwxOC41IDI3LjUsMzUuMyA0MS42LDUwYy0z%0D%0AMi42LDMwLjMgLTYzLjIsNDYuOSAtODQsNDYuOWMtNC41LC0wLjEgLTguMywtMSAtMTEuMywtMi43%0D%0Aem0yMzcuMiwtNzYuMmM0LjcsMzguMiAtMS4xLDY3LjkgLTE0LjYsNzUuOGMtMywxLjggLTYuOSwy%0D%0ALjYgLTExLjUsMi42Yy0yMC43LDAgLTUxLjQsLTE2LjUgLTg0LC00Ni42YzE0LC0xNC43IDI4LC0z%0D%0AMS40IDQxLjMsLTQ5LjljMjIuNiwtMi40IDQ0LC02LjEgNjMuNiwtMTFjMi4zLDEwLjEgNC4xLDE5%0D%0ALjggNS4yLDI5LjF6bTM4LjUsLTY2LjdjLTguNiwzLjcgLTE4LDcgLTI3LjcsMTAuMWMtNS43LC0x%0D%0AOS42IC0xMy4yLC00MCAtMjIuNSwtNjAuOWM5LjIsLTIwLjggMTYuNiwtNDEuMSAyMi4yLC02MC42%0D%0AYzkuOSwzLjEgMTkuMyw2LjUgMjguMSwxMC4yYzM1LjQsMTUuMSA1OC4zLDM0LjkgNTguMyw1MC42%0D%0AYy0wLjEsMTUuNyAtMjMsMzUuNiAtNTguNCw1MC42eiIgZmlsbD0iIzYxREFGQiIvPg0KCTxwb2x5%0D%0AZ29uIGlkPSJzdmdfMyIgcG9pbnRzPSIxNDcuNzk5OTg3NzkyOTY4NzUsMi40MDAwMDE1MjU4Nzg5%0D%0AMDYyIDE0Ny43OTk5ODc3OTI5Njg3NSwyLjQwMDAwMTUyNTg3ODkwNjIgMTQ3Ljc5OTk4Nzc5Mjk2%0D%0AODc1LDIuNDAwMDAxNTI1ODc4OTA2MiAiIGZpbGw9IiM2MURBRkIiLz4NCgk8Y2lyY2xlIGlkPSJz%0D%0AdmdfNCIgcj0iNDUuNyIgY3k9IjIyMC41IiBjeD0iMjQ3LjkiIGZpbGw9IiM2MURBRkIiLz4NCgk8%0D%0AcG9seWdvbiBpZD0ic3ZnXzUiIHBvaW50cz0iMzQ3LjUsMi4wOTk5OTg0NzQxMjEwOTM4IDM0Ny41%0D%0ALDIuMDk5OTk4NDc0MTIxMDkzOCAzNDcuNSwyLjA5OTk5ODQ3NDEyMTA5MzggIiBmaWxsPSIjNjFE%0D%0AQUZCIi8+DQoNCjwvc3ZnPg0K
[logo_vue]: data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPHN2ZyB2ZXJzaW9uPSIxLjEi%0D%0AIHZpZXdCb3g9IjAgMCAyNjEuNzYgMjI2LjY5IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAw%0D%0AMC9zdmciPjxnIHRyYW5zZm9ybT0ibWF0cml4KDEuMzMzMyAwIDAgLTEuMzMzMyAtNzYuMzExIDMx%0D%0AMy4zNCkiPjxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKDE3OC4wNiAyMzUuMDEpIj48cGF0aCBkPSJt%0D%0AMCAwLTIyLjY2OS0zOS4yNjQtMjIuNjY5IDM5LjI2NGgtNzUuNDkxbDk4LjE2LTE3MC4wMiA5OC4x%0D%0ANiAxNzAuMDJ6IiBmaWxsPSIjNDFiODgzIi8+PC9nPjxnIHRyYW5zZm9ybT0idHJhbnNsYXRlKDE3%0D%0AOC4wNiAyMzUuMDEpIj48cGF0aCBkPSJtMCAwLTIyLjY2OS0zOS4yNjQtMjIuNjY5IDM5LjI2NGgt%0D%0AMzYuMjI3bDU4Ljg5Ni0xMDIuMDEgNTguODk2IDEwMi4wMXoiIGZpbGw9IiMzNDQ5NWUiLz48L2c+%0D%0APC9nPjwvc3ZnPgo=
[logo_elm]: data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4KPCEtLSBHZW5lcmF0b3I6IEFk%0D%0Ab2JlIElsbHVzdHJhdG9yIDE3LjEuMCwgU1ZHIEV4cG9ydCBQbHVnLUluIC4gU1ZHIFZlcnNpb246%0D%0AIDYuMDAgQnVpbGQgMCkgIC0tPgo8IURPQ1RZUEUgc3ZnIFBVQkxJQyAiLS8vVzNDLy9EVEQgU1ZH%0D%0AIDEuMS8vRU4iICJodHRwOi8vd3d3LnczLm9yZy9HcmFwaGljcy9TVkcvMS4xL0RURC9zdmcxMS5k%0D%0AdGQiPgo8c3ZnIHZlcnNpb249IjEuMSIgaWQ9IkVsbV9Mb2dvIiAKICB4bWxucz0iaHR0cDovL3d3%0D%0Ady53My5vcmcvMjAwMC9zdmciIAogIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5%0D%0AL3hsaW5rIiB4PSIwcHgiIHk9IjBweCIgdmlld0JveD0iMCAwIDMyMy4xNDEgMzIyLjk1IiBlbmFi%0D%0AbGUtYmFja2dyb3VuZD0ibmV3IDAgMCAzMjMuMTQxIDMyMi45NSIgeG1sOnNwYWNlPSJwcmVzZXJ2%0D%0AZSI+CiAgPGc+CiAgICA8cG9seWdvbiBmaWxsPSIjRjBBRDAwIiBwb2ludHM9IjE2MS42NDksMTUy%0D%0ALjc4MiAyMzEuNTE0LDgyLjkxNiA5MS43ODMsODIuOTE2Ii8+CgogICAgPHBvbHlnb24gZmlsbD0i%0D%0AIzdGRDEzQiIgcG9pbnRzPSI4Ljg2NywwIDc5LjI0MSw3MC4zNzUgMjMyLjIxMyw3MC4zNzUgMTYx%0D%0ALjgzOCwwIi8+CgogICAgPHJlY3QgZmlsbD0iIzdGRDEzQiIgeD0iMTkyLjk5IiB5PSIxMDcuMzky%0D%0AIiB0cmFuc2Zvcm09Im1hdHJpeCgwLjcwNzEgMC43MDcxIC0wLjcwNzEgMC43MDcxIDE4Ni40NzI3%0D%0AIC0xMjcuMjM4NikiIHdpZHRoPSIxMDcuNjc2IiBoZWlnaHQ9IjEwOC4xNjciLz4KCiAgICA8cG9s%0D%0AeWdvbiBmaWxsPSIjNjBCNUNDIiBwb2ludHM9IjMyMy4yOTgsMTQzLjcyNCAzMjMuMjk4LDAgMTc5%0D%0ALjU3MywwIi8+CgogICAgPHBvbHlnb24gZmlsbD0iIzVBNjM3OCIgcG9pbnRzPSIxNTIuNzgxLDE2%0D%0AMS42NDkgMCw4Ljg2OCAwLDMxNC40MzIiLz4KCiAgICA8cG9seWdvbiBmaWxsPSIjRjBBRDAwIiBw%0D%0Ab2ludHM9IjI1NS41MjIsMjQ2LjY1NSAzMjMuMjk4LDMxNC40MzIgMzIzLjI5OCwxNzguODc5Ii8+%0D%0ACgogICAgPHBvbHlnb24gZmlsbD0iIzYwQjVDQyIgcG9pbnRzPSIxNjEuNjQ5LDE3MC41MTcgOC44%0D%0ANjksMzIzLjI5OCAzMTQuNDMsMzIzLjI5OCIvPgogIDwvZz4KPC9zdmc+Cg==
[logo_wc]: data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTYxIiBoZWlnaHQ9IjEzMiIgdmlld0JveD0iMCAwIDE2MSAxMzIiIHhtbG5z%0D%0APSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGRlZnM+PGxpbmVhckdyYWRpZW50IHgxPSIw%0D%0AJSIgeTE9IjUwJSIgeTI9IjUwJSIgaWQ9ImEiPjxzdG9wIHN0b3AtY29sb3I9IiMyQTNCOEYiIG9m%0D%0AZnNldD0iMCUiLz48c3RvcCBzdG9wLWNvbG9yPSIjMjlBQkUyIiBvZmZzZXQ9IjEwMCUiLz48L2xp%0D%0AbmVhckdyYWRpZW50PjxsaW5lYXJHcmFkaWVudCB4MT0iMTAwJSIgeTE9IjUwJSIgeDI9IjAlIiB5%0D%0AMj0iNTAlIiBpZD0iYyI+PHN0b3Agc3RvcC1jb2xvcj0iI0I0RDQ0RSIgb2Zmc2V0PSIwJSIvPjxz%0D%0AdG9wIHN0b3AtY29sb3I9IiNFN0Y3MTYiIG9mZnNldD0iMTAwJSIvPjwvbGluZWFyR3JhZGllbnQ+%0D%0APC9kZWZzPjxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+PHBhdGggZmlsbD0iIzE2%0D%0ANkRBNSIgZD0iTTE2MC42IDY1LjlsLTE3LjQgMjkuMy0yNC40LTI5LjcgMjQuNC0yOC45eiIvPjxw%0D%0AYXRoIGZpbGw9IiM4RkRCNjkiIGQ9Ik0xNDEuMyAxMDAuMmwtMjYuNS0zMS43LTE1LjkgMjYuNiAy%0D%0ANC43IDM2LjF6Ii8+PHBhdGggZmlsbD0iIzE2NkRBNSIgZD0iTTE0MSAzMS40bC0yNi4yIDMxLjgt%0D%0AMTUuOS0yNi42TDEyMy42Ljl6Ii8+PHBhdGggZmlsbD0idXJsKCNhKSIgb3BhY2l0eT0iLjk1IiBk%0D%0APSJNNjEuMSAzMS40SDE0MUwxMjMuNC43SDc4Ljd6IE0xMTQuOCA2My4zSDE1OWwtMTUuOS0yNi44%0D%0ASDk4LjgiLz48cGF0aCBmaWxsPSJ1cmwoI2MpIiBvcGFjaXR5PSIuOTUiIGQ9Ik0xNDEuMyAxMDAu%0D%0AM0g2MWwxNy42IDMwLjVoNDV6IE0xMTQuOCA2OC40SDE1OWwtMTUuOSAyNi44SDk4LjgiLz48cGF0%0D%0AaCBmaWxsPSIjMDEwMTAxIiBkPSJNNzguNiAxMzAuOEw0MSA2NS44IDc5LjEuOEgzNy45TC40IDY1%0D%0ALjhsMzcuNSA2NXoiLz48L2c+PC9zdmc+
[logo_svelte]: data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iOTUiIGhlaWdodD0iMTE1IiB2aWV3Qm94PSIwIDAgOTUgMTE1IiAKICAgIHht%0D%0AbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CiAgICA8Zz4KICAgICAgICA8cGF0aCBz%0D%0AdHJva2U9Im51bGwiIGQ9Im04Ny4xNDg5NzEsMTYuMzljLTEwLjQsLTE0Ljg4IC0zMC45NCwtMTku%0D%0AMjkgLTQ1Ljc5LC05LjgzbC0yNi4wOCwxNi42MmEyOS45LDI5LjkgMCAwIDAgLTEzLjUyLDIwYTMx%0D%0ALjUzLDMxLjUzIDAgMCAwIDMuMSwyMC4yNGEyOS45NCwyOS45NCAwIDAgMCAtNC40NywxMS4xOGEz%0D%0AMS44NiwzMS44NiAwIDAgMCA1LjQ1LDI0LjEyYzEwLjQsMTQuODggMzAuOTQsMTkuMjkgNDUuNzks%0D%0AOS44M2wyNi4wOCwtMTYuNTVhMzAsMzAgMCAwIDAgMTMuNTIsLTIwYTMxLjUyLDMxLjUyIDAgMCAw%0D%0AIC0zLjExLC0yMC4yM2EzMC4xMywzMC4xMyAwIDAgMCA0LjQ4LC0xMS4xOGEzMS45LDMxLjkgMCAw%0D%0AIDAgLTUuNDUsLTI0LjEyIiBmaWxsPSIjZmYzZTAwIiBpZD0iYmFjayIvPgogICAgICAgIDxwYXRo%0D%0AIGQ9Im0zOC44MDg4MTIsMTAwLjEzNTMyOWEyMC43MywyMC43MyAwIDAgMSAtMjIuMjQsLTguMjVh%0D%0AMTkuMTQsMTkuMTQgMCAwIDEgLTMuMjcsLTE0LjVhMTcsMTcgMCAwIDEgMC42MiwtMi40MWwwLjQ5%0D%0ALC0xLjVsMS4zNCwxYTMzLjc4LDMzLjc4IDAgMCAwIDEwLjE3LDUuMDZsMSwwLjI5bC0wLjA5LDFh%0D%0ANS45LDUuOSAwIDAgMCAxLjA5LDMuODVhNi4yNSw2LjI1IDAgMCAwIDYuNywyLjQ4YTUuODUsNS44%0D%0ANSAwIDAgMCAxLjYsLTAuN2wyNi4wNCwtMTYuNjJhNS40Miw1LjQyIDAgMCAwIDIuNDUsLTMuNjRh%0D%0ANS43Nyw1Ljc3IDAgMCAwIC0xLC00LjM3YTYuMjUsNi4yNSAwIDAgMCAtNi43LC0yLjQ4YTUuNzIs%0D%0ANS43MiAwIDAgMCAtMS42LDAuN2wtMTAsNi4zNWExOS4xLDE5LjEgMCAwIDEgLTUuMjksMi4zMmEy%0D%0AMC43MiwyMC43MiAwIDAgMSAtMjIuMiwtOC4yNGExOS4xNiwxOS4xNiAwIDAgMSAtMy4yNSwtMTQu%0D%0ANWExOCwxOCAwIDAgMSA4LjEzLC0xMi4wNmwyNi4xMiwtMTYuNjJhMTkuMDUsMTkuMDUgMCAwIDEg%0D%0ANS4yNiwtMi4zMmEyMC43MSwyMC43MSAwIDAgMSAyMi4yMyw4LjI1YTE5LjE0LDE5LjE0IDAgMCAx%0D%0AIDMuMjgsMTQuNWEyMC4xNSwyMC4xNSAwIDAgMSAtMC42MiwyLjQzbC0wLjUsMS41bC0xLjMzLC0x%0D%0AYTMzLjc4LDMzLjc4IDAgMCAwIC0xMC4yLC01LjFsLTEsLTAuMjlsMC4wOSwtMWE1Ljg2LDUuODYg%0D%0AMCAwIDAgLTEuMDYsLTMuODhhNi4yMyw2LjIzIDAgMCAwIC02LjY2LC0yLjQxYTUuNzIsNS43MiAw%0D%0AIDAgMCAtMS42LDAuN2wtMjYuMDksMTYuNTlhNS40NSw1LjQ1IDAgMCAwIC0yLjQ1LDMuNjNhNS44%0D%0ANCw1Ljg0IDAgMCAwIDEsNC4zOGE2LjI1LDYuMjUgMCAwIDAgNi42NSwyLjQ4YTYsNiAwIDAgMCAx%0D%0ALjYsLTAuN2wxMCwtNi4zNGExOC42MSwxOC42MSAwIDAgMSA1LjMsLTIuMzNhMjAuNywyMC43IDAg%0D%0AMCAxIDIyLjIzLDguMjRhMTkuMTYsMTkuMTYgMCAwIDEgMy4yOCwxNC41YTE4LDE4IDAgMCAxIC04%0D%0ALjEzLDEyLjA2bC0yNi4wOSwxNi42MmExOS4xOCwxOS4xOCAwIDAgMSAtNS4zLDIuMzMiIGZpbGw9%0D%0AIiNmZmYiIGlkPSJmcm9udCIvPgogICAgPC9nPgo8L3N2Zz4K
[logo_angular]: data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4KPCEtLSBHZW5lcmF0b3I6IEFk%0D%0Ab2JlIElsbHVzdHJhdG9yIDE5LjEuMCwgU1ZHIEV4cG9ydCBQbHVnLUluIC4gU1ZHIFZlcnNpb246%0D%0AIDYuMDAgQnVpbGQgMCkgIC0tPgo8c3ZnIHZlcnNpb249IjEuMSIgaWQ9IkxheWVyXzEiIHhtbG5z%0D%0APSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMu%0D%0Ab3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4IgoJIHZpZXdCb3g9IjAgMCAyNTAgMjUwIiBz%0D%0AdHlsZT0iZW5hYmxlLWJhY2tncm91bmQ6bmV3IDAgMCAyNTAgMjUwOyIgeG1sOnNwYWNlPSJwcmVz%0D%0AZXJ2ZSI+CjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+Cgkuc3Qwe2ZpbGw6I0REMDAzMTt9Cgkuc3Qx%0D%0Ae2ZpbGw6I0MzMDAyRjt9Cgkuc3Qye2ZpbGw6I0ZGRkZGRjt9Cjwvc3R5bGU+CjxnPgoJPHBvbHln%0D%0Ab24gY2xhc3M9InN0MCIgcG9pbnRzPSIxMjUsMzAgMTI1LDMwIDEyNSwzMCAzMS45LDYzLjIgNDYu%0D%0AMSwxODYuMyAxMjUsMjMwIDEyNSwyMzAgMTI1LDIzMCAyMDMuOSwxODYuMyAyMTguMSw2My4yIAki%0D%0ALz4KCTxwb2x5Z29uIGNsYXNzPSJzdDEiIHBvaW50cz0iMTI1LDMwIDEyNSw1Mi4yIDEyNSw1Mi4x%0D%0AIDEyNSwxNTMuNCAxMjUsMTUzLjQgMTI1LDIzMCAxMjUsMjMwIDIwMy45LDE4Ni4zIDIxOC4xLDYz%0D%0ALjIgMTI1LDMwIAkiLz4KCTxwYXRoIGNsYXNzPSJzdDIiIGQ9Ik0xMjUsNTIuMUw2Ni44LDE4Mi42%0D%0AaDBoMjEuN2gwbDExLjctMjkuMmg0OS40bDExLjcsMjkuMmgwaDIxLjdoMEwxMjUsNTIuMUwxMjUs%0D%0ANTIuMUwxMjUsNTIuMUwxMjUsNTIuMQoJCUwxMjUsNTIuMXogTTE0MiwxMzUuNEgxMDhsMTctNDAu%0D%0AOUwxNDIsMTM1LjR6Ii8+CjwvZz4KPC9zdmc+Cg==
[logo_angularjs]: data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9Im5vIj8+Cjwh%0D%0ARE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cu%0D%0AdzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+CjxzdmcgdmVyc2lvbj0iMS4x%0D%0AIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8v%0D%0Ad3d3LnczLm9yZy8xOTk5L3hsaW5rIiBwcmVzZXJ2ZUFzcGVjdFJhdGlvPSJ4TWlkWU1pZCBtZWV0%0D%0AIiB2aWV3Qm94PSIzLjA1NDAwMDAwMDAwMDAwMDMgMy4zNzUgMTY5LjkwOCAxNzkuNzUiIHdpZHRo%0D%0APSIxNjUuOTEiIGhlaWdodD0iMTc1Ljc1Ij48ZGVmcz48cGF0aCBkPSJNODYuODMgMTgwLjEzTDE1%0D%0ANi45IDE0MS4yOUwxNjkuOTYgMzIuOTZMODYuNzQgNC4zOEw0LjA1IDMzLjQ4TDE3LjEyIDE0MS44%0D%0AMUw4Ni44MyAxODAuMTNaIiBpZD0iYmZjbGFlSDNBIj48L3BhdGg+PHBhdGggZD0iTTE0OS41NCAx%0D%0AMzYuMTFMMTYxLjcxIDM5LjIyTDg2LjU1IDEzLjU5TDg2LjU1IDE3MC45N0wxNDkuNTQgMTM2LjEx%0D%0AWiIgaWQ9ImExamQ1dzlwZCI+PC9wYXRoPjxwYXRoIGQ9Ik04Ni41NSAxMy41OUwxMy4zMyAzOS42%0D%0AOEwyNC41MyAxMzYuNTdMODYuNTUgMTcwLjk3TDg2LjU1IDEzLjU5WiIgaWQ9ImEyYTc1YlhGViI+%0D%0APC9wYXRoPjxwYXRoIGQ9Ik04Ni41NSAxMDcuMDVMNjQuNzQgMTA3LjA1TDU0LjQ5IDEzMi42OUwz%0D%0ANS40MyAxMzMuMDRMODYuNTUgMTkuM0wxMDcuMjQgOTcuMzdMODYuNTUgMTA3LjA1Wk04Ni41NSA5%0D%0AMS44N0wxMDUuMjQgOTIuNUw4Ni42OSA1NS43N0w3MS40NyA5MS44N0w4Ni41NSA5MS44N1oiIGlk%0D%0APSJhcTZWQ1RVWm0iPjwvcGF0aD48cGF0aCBkPSJNODYuNTkgOTEuOUw4Ni41NSAxMDcuMDJMMTEw%0D%0ALjU2IDEwNy4wNUwxMjEuNzkgMTMzLjA0TDE0MC4wMyAxMzMuMzhMODYuNTUgMTkuM0w4Ni42OSA1%0D%0ANS43N0wxMDMuOTUgOTEuOUw4Ni41OSA5MS45WiIgaWQ9ImNsRWRQcHB2byI+PC9wYXRoPjwvZGVm%0D%0Acz48Zz48Zz48dXNlIHhsaW5rOmhyZWY9IiNiZmNsYWVIM0EiIG9wYWNpdHk9IjEiIGZpbGw9IiNi%0D%0AM2IzYjMiIGZpbGwtb3BhY2l0eT0iMSI+PC91c2U+PGc+PHVzZSB4bGluazpocmVmPSIjYmZjbGFl%0D%0ASDNBIiBvcGFjaXR5PSIxIiBmaWxsLW9wYWNpdHk9IjAiIHN0cm9rZT0iIzAwMDAwMCIgc3Ryb2tl%0D%0ALXdpZHRoPSIxIiBzdHJva2Utb3BhY2l0eT0iMCI+PC91c2U+PC9nPjwvZz48Zz48dXNlIHhsaW5r%0D%0AOmhyZWY9IiNhMWpkNXc5cGQiIG9wYWNpdHk9IjEiIGZpbGw9IiNhNjEyMGQiIGZpbGwtb3BhY2l0%0D%0AeT0iMSI+PC91c2U+PGc+PHVzZSB4bGluazpocmVmPSIjYTFqZDV3OXBkIiBvcGFjaXR5PSIxIiBm%0D%0AaWxsLW9wYWNpdHk9IjAiIHN0cm9rZT0iIzAwMDAwMCIgc3Ryb2tlLXdpZHRoPSIxIiBzdHJva2Ut%0D%0Ab3BhY2l0eT0iMCI+PC91c2U+PC9nPjwvZz48Zz48dXNlIHhsaW5rOmhyZWY9IiNhMmE3NWJYRlYi%0D%0AIG9wYWNpdHk9IjEiIGZpbGw9IiNkZDFiMTYiIGZpbGwtb3BhY2l0eT0iMSI+PC91c2U+PGc+PHVz%0D%0AZSB4bGluazpocmVmPSIjYTJhNzViWEZWIiBvcGFjaXR5PSIxIiBmaWxsLW9wYWNpdHk9IjAiIHN0%0D%0Acm9rZT0iIzAwMDAwMCIgc3Ryb2tlLXdpZHRoPSIxIiBzdHJva2Utb3BhY2l0eT0iMCI+PC91c2U+%0D%0APC9nPjwvZz48Zz48dXNlIHhsaW5rOmhyZWY9IiNhcTZWQ1RVWm0iIG9wYWNpdHk9IjEiIGZpbGw9%0D%0AIiNmMmYyZjIiIGZpbGwtb3BhY2l0eT0iMSI+PC91c2U+PGc+PHVzZSB4bGluazpocmVmPSIjYXE2%0D%0AVkNUVVptIiBvcGFjaXR5PSIxIiBmaWxsLW9wYWNpdHk9IjAiIHN0cm9rZT0iIzAwMDAwMCIgc3Ry%0D%0Ab2tlLXdpZHRoPSIxIiBzdHJva2Utb3BhY2l0eT0iMCI+PC91c2U+PC9nPjwvZz48Zz48dXNlIHhs%0D%0AaW5rOmhyZWY9IiNjbEVkUHBwdm8iIG9wYWNpdHk9IjEiIGZpbGw9IiNiM2IzYjMiIGZpbGwtb3Bh%0D%0AY2l0eT0iMSI+PC91c2U+PGc+PHVzZSB4bGluazpocmVmPSIjY2xFZFBwcHZvIiBvcGFjaXR5PSIx%0D%0AIiBmaWxsLW9wYWNpdHk9IjAiIHN0cm9rZT0iIzAwMDAwMCIgc3Ryb2tlLXdpZHRoPSIxIiBzdHJv%0D%0Aa2Utb3BhY2l0eT0iMCI+PC91c2U+PC9nPjwvZz48L2c+PC9zdmc+
