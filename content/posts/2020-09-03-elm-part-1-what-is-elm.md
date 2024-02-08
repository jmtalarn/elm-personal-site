---
title: What is Elm? Baby don't hurt me, no more
date: 2020-09-03T11:15:51
type: post
slug: learning-elm-part-1-what-is-elm
cover: /images/featured/elm-elmo.png
category: ['Web development']
tags: ['web', 'elm', 'functional programming']
author: jmtalarn
---

# What is Elm ?

 > **Elm** is a functional language that compiles to JavaScript. 

And that means it moves the functional programming paradigm into the frontend development, allowing you to build from simple websites to complex web apps. 


Don't be scared 🙀. 


Elm is both a functional programming language with its own syntax and grammar but is also an application development framework.

The hard part (not at all if you continue reading) is that is a **typed functional language**. And that means that you should deal with functional terms like immutable, monad, currying and recursion...
<!--more-->

But here it comes the good part, **Elm** is developer focused. And that means that everything around the language is based on make a pleasant experience for the developer during the job of coding. Even you are working with a functional language, you can start with the simplest thing and you will see yourself going deep through all the related concepts gradually finding solutions about what you want to do.


### Excellent documentation.
It has tons of documentation and examples in the official site where you can find from a getting started guide to examples and explanation about the Elm architecture
<a href="https://guide.elm-lang.org/" class="card-preview" target="_blank" data-size="small">Elm Official Guide</a> 
and almost all of the libraries out there are the same with extended documentation about uses and examples.
<a href="https://package.elm-lang.org/" class="card-preview" target="_blank" data-size="small">Package Docs</a> 


### Friendly error messages.
All messages from the compiler are exposed in a clear and concise way, assisting you and providing hints and suggestions about what can be wrong with really friendly error messages and it looks like the program can really guess which is your intention. The messages usually gives you the kind of error name, the file affected and prints out the line with the previous and next line and points exactly where the error occurred. Also it will try to guess what do you intended to do and suggest possible solutions.

### No Runtime Exceptions
Elm uses type inference to detect corner cases and give friendly hints. You won't have to dig into the code to fix a confusing runtime exception in production.

```elm
-- TYPE MISMATCH ---------------------------- Main.elm

The 1st argument to `drop` is not what I expect:

8|   List.drop (String.toInt userInput) [1,2,3,4,5,6]
                ^^^^^^^^^^^^^^^^^^^^^^
This `toInt` call produces:

    Maybe Int

But `drop` needs the 1st argument to be:

    Int

Hint: Use Maybe.withDefault to handle possible errors.
```

### Great maintainability
One of the features of the language is that uses static type checking, so that means that variables type is known at compile time. Any error in there, will raise an error on compilation time. Whenever you do a code refactoring the compiler knows all the places where the application is broke and will report it with nice error messages as we saw above.

### Enforced Semantic Versioning
Again the type system will help Elm to detect all API changes automatically and tis information is used to guarantee that every single Elm package follows semantic versioning precisely. No surprises in PATCH releases. With the `elm diff` command we can get the differences in the changes and will tell you it it is a major, minor or patch change.

```bash
$ elm diff Microsoft/elm-json-tree-view 1.0.0 2.0.0
This is a MAJOR change.

---- JsonTree - MAJOR ----

    Changed:
      - parseString : String -> Result String Node
      + parseString : String -> Result Error Node

      - parseValue : Value -> Result String Node
      + parseValue : Value -> Result Error Node
```

### No side effects
Also, as it is a **pure functional** language it implies that there are not side effects of any type inside the "safe" area. But still, we have to consider that the code is finally translated into Javascript and in many occasions it needs to interoperate with different browser APIs, for sure in Javascript, so we still need to know where the "unsafe" area is.

### JavaScript Interop
As the final application needs to work together with the browser or other apps in the same environment there is the need of mechanisms to perform this interoperability with Javascript.
<dl>
<dt><strong>flags</strong></dt><dd>Flags are values passed into Elm in the initialization instant. So we can pass values from the browser to the Elm application start and it will be valid any value that can be JSON encoded/decoded. The init function in the Elm application will be in charge to set it up accordingly to be used.</dd>
<dt><strong>ports</strong></dt><dd>Ports allow communication between Elm and JavaScript. We will set in the Javascript a `subscribe` and `send` method in the ports where we will read in the "unsafe" area and send it back to the `safe` are. In the same way, in the Elm side we will send messages to the port with a Command while we will set a Subscription to read from there.</dd>
<dt><strong>custom elements</strong></dt><dd>From Elm we can use any custom element (a.k.a. web component) created so any value can be passed to the HTML.</dd>
</dl>


### Great Performance
Elm has its own virtual DOM implementation, designed for simplicity and speed. All values are immutable in Elm, and the benchmarks show that this helps us generate particularly fast JavaScript code.


| Framework &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |Milliseconds on Chrome 52|
|----------------------------------------------|------------------------:|
| React                                        |4612 ms                  |
| Ember                                        |4326 ms                  |
| AngularJs                                    |3838 ms                  |
| Angular                                      |3494 ms                  |
| Elm                                          |2480 ms                  |



### Small Assets
Smaller assets means faster downloads and faster page loads, so Elm does a bunch of optimizations to make small assets the default. Just compile with the `--optimize` flag and let the compiler do the rest. No complicated set up.


| Framework  | Asset size (uglified & gzipped)   |
|------------|----------------------------------:|
| Vue 2.5    | 100kb                             |
| Angular 6  | 93kb                              |
| React 16.4 | 77kb                              |
| Elm        | 29kb                              |





## Try Elm
Elm can take over a single node, so you can try it out on a small part of an existing project. Try it for something small. See if you like it.

<a href="https://elm-lang.org/try" class="card-preview" target="_blank">Try Elm</a>

