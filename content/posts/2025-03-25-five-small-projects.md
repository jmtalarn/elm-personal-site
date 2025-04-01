---
title: Five small projects I've recently built
date: "2025-03-25T23:05:01"
type: post
slug: five-recent-small-projects
cover: /images/featured/small-projects-i-worked.jpg
category: ["Web development"]
tags:
    [
        "web",
        "elm",
        "functional programming",
        "typescript",
        "react",
        "vite",
        "storybook",
        "pwa",
    ]
author: jmtalarn
---

Here there are few projects I've been working recently, mostly for my own amusement. In some of them I used Vite, Typescript and React to build small Progressive Web applications with local-first approach. The other ones are about coding in Elm, which is one of my favourite programming languages.<!--more-->

I've been doing also other personal stuff talking about coding, but I consider these as finished, or live projects, so it makes more sense to put on this small announce.

# <tech-icon icon="ts" style="width: 2rem; height: 2rem; margin-right: .5rem; margin-top: 6rem; display: inline;"></tech-icon> kids-reward-system jmtalarn/kids-reward-system

A reward system to help children build habits is a great way to make learning and growth fun and engaging, encouraging positive behavior and motivation.

<img title="Kids Reward System" style="width: 20rem;" src="/images/5_rct_prj_KRS.png" alt="Kids Reward System" />

The `kids-reward-system` project is implemented as a Progressive Web Application (PWA) using React and TypeScript. It leverages local storage to persist data directly on the user's device, ensuring a local-first approach that works seamlessly offline. The application is designed to be modular and reusable, with components built and tested in isolation using Storybook. Vite is used as the build tool, providing a fast and efficient development experience.

The core functionality revolves around managing rewards and tracking progress for children. The app includes features such as adding tasks, assigning rewards, and monitoring completion. React's state management is used to handle the dynamic updates, while TypeScript ensures type safety throughout the codebase. The project is deployed on Netlify, making it easily accessible and shareable via the provided URL.

### Technologies and tools

-   React
-   TypeScript
-   Storybook
-   Vite

# <tech-icon icon="elm" style="width: 2rem; height: 2rem; margin-right: .5rem; margin-top: 6rem; display: inline;"></tech-icon> elm-personal-site jmtalarn/elm-personal-site

The `elm-personal-site` project is a personal website and blog built using Elm and Elm-pages. The implementation leverages Elm-pages to handle static site generation, allowing the content to be sourced from Markdown files. Each blog post, like this one, is written in Markdown and processed into HTML during the build process. The site structure is defined using `elm/html`, ensuring a clean and functional design.

The project emphasizes simplicity and maintainability, with Elm's strong type system ensuring robust and error-free code. The use of Elm-pages enables seamless routing and dynamic content rendering, while the integration with Netlify provides an easy deployment pipeline. The site also includes custom components for navigation, post previews, and other UI elements, all implemented in Elm for a consistent and performant user experience.

### URL

-   [https://www.jmtalarn.com/](https://www.jmtalarn.com/)
-   [https://github.com/jmtalarn/elm-personal-site](https://github.com/jmtalarn/elm-personal-site)

### Technologies and tools

-   JavaScript
-   CSS
-   API
-   JSON
-   Netlify
-   Elm
-   elm-pages
-   Markdown

# <tech-icon icon="elm" style="width: 2rem; height: 2rem; margin-right: .5rem; margin-top: 6rem; display: inline;"></tech-icon> shared-casting jmtalarn/shared-casting

I use to do searches about cast while I'm watching TV Shows or Movies, so I created this web application with Elm using the TMDB.org api where you can find cast shared between two TV Shows/Movies.

![Project image](/images/5_rct_prj_SC.png)

The `shared-casting` project is a web application built using Elm, designed to find actors or cast members shared between two TV shows or movies. It integrates with the TMDB.org API to fetch and display relevant data. The application features a clean and intuitive user interface, leveraging Elm's strong type system to ensure reliability and maintainability.

To handle API communication, the project uses Netlify Functions, which provide a lightweight backend layer written in Node.js. These serverless functions act as a bridge between the frontend and the TMDB API, securely managing API keys and requests. The app processes user input to query the API for two selected titles, retrieves their cast lists, and computes the intersection to display shared cast members. The combination of Elm for the frontend and Netlify Functions for backend logic ensures a seamless and efficient user experience.

### Technologies and tools

-   JavaScript
-   CSS
-   API
-   JSON
-   Netlify
-   Elm

#  <tech-icon icon="elm" style="width: 2rem; height: 2rem; margin-right: .5rem; margin-top: 6rem; display: inline;"></tech-icon> 30-days-of-elm jmtalarn/30-days-of-elm

The `30-days-of-elm` project is a learning initiative designed to explore the Elm programming language through a series of small, focused exercises and projects. Each day introduces a new concept or feature of Elm, building on the previous days to gradually deepen understanding. The project is structured as a Progressive Web Application (PWA) hosted on Netlify, providing an interactive and accessible platform for users to follow along.

<img title="30 days of elm" style="width: 20rem;" src="/images/30-days-of-elm.jpeg" alt="30 days of elm" />

The implementation leverages Elm's strong type system and functional programming paradigm to create a robust and error-free learning experience. The exercises are organized into modules, with each module focusing on a specific topic such as Elm architecture, commands, subscriptions, or custom types. The app includes a clean and minimalistic user interface, ensuring that users can focus on the learning material without distractions. The source code is open-source and available on GitHub, encouraging collaboration and contributions from the Elm community.

### URL

-   [https://30-days-of-elm.netlify.app/](https://30-days-of-elm.netlify.app/)
-   [https://github.com/jmtalarn/30-days-of-elm](https://github.com/jmtalarn/30-days-of-elm)

### Technologies and tools

-   Elm
-   Netlify
-   Elm-spa
-   Elm-land
-   Javascript

# <tech-icon icon="ts" style="width: 2rem; height: 2rem; margin-right: .5rem; margin-top: 6rem; display: inline;"></tech-icon> dd-ab-savegame jmtalarn/dd-ab-savegame

Dungeons and Dragons - Adventure begins is a board game based on the characters from Dungeons and Dragons. It uses to be a not so long game (45 minutes to 1 hour) but sometimes kids want to play another thing or we don't have any more time available to play so I created this progressive web application to save the stats of the current game.

![Project image](/images/5_rct_prj_DDABSG.png)

The `dd-ab-savegame` project is implemented as a Progressive Web Application (PWA) using React and TypeScript. It leverages local storage to persist game data directly on the user's device, ensuring a local-first approach that works seamlessly offline. The application features a simple and intuitive user interface, allowing players to save and load their game progress effortlessly.

The project is structured with modular React components, making it easy to maintain and extend. State management is handled using React's built-in hooks, ensuring a responsive and dynamic user experience. The use of TypeScript provides strong type safety, reducing potential bugs and improving code readability. The application is built and optimized using Vite, which ensures fast development and build times. Additionally, Storybook is used to develop and test UI components in isolation, ensuring a consistent and polished design. The project is deployed on GitHub Pages, making it easily accessible to users via the provided URL.

### Technologies and tools

-   React
-   CSS
-   TypeScript
-   Storybook
-   Vite

### URLS

-   [https://jmtalarn.github.io/dd-ab-savegame/](https://jmtalarn.github.io/dd-ab-savegame/)
-   [https://github.com/jmtalarn/dd-ab-savegame](https://github.com/jmtalarn/dd-ab-savegame)

# HELLO LINK PREVIEW CARDS!

<link-preview url="https://www.123cards.com/"></link-preview>

<link-preview url="https://www.uber.com/"></link-preview>

<link-preview url="https://react.dev/"></link-preview >

<link-preview url="https://www.jmtalarn.com/">JMTALARN</link-preview>

<link-preview url="https://jmtalarn.com/blog/post/running-node-js-react-tests-same-project"></link-preview>
