---
title: React quick overview and nested components
date: "2018-03-13T01:52:42"
type: post
slug: reactjs-overview-nested-components
cover: /images/featured/reactjs-passdata.jpg
category: ["Web development"]
tags: ["components", "web", "html", "react", "javascript"]
author: jmtalarn
---

## What is React?

[React](/https://reactjs.org/ "React web site") (sometimes called also ReactJs) is a library to create reusable components and build with that your web applications.
Its development was leaded by [Facebook development](https://code.facebook.com/projects) teams. Nowadays is pretty widely used around the world and there is a high demand of professionals
with knowdledge and experience with the technology.

<!--more-->

    HTML5, CSS and Javascript is almost all you need to know to start coding a web component with React. In fact, you will be
    writting JSX instead of HMTL but don't worry because is mostly the same as HTML with only some variations for reserved
    words as you are actually writting it inside your Javascript code.


    *e.g. to define the CSS classes that applies to an element it will use
        **className** instead of
        **class** as it is the word to declare a class in Javascript*



    Probably you'll want to code with Javascript using the latest specifications of the language then you'll using [Babel](https://babeljs.io/) together with your development with a build task.

<h2>How React works?</h2>
To explain it in terms of the newly introduced
    *classes* sugar a React component isn't anything that a
    *class* extending the React component class with a
    `render` method where it returns the JSX content of your component.

```javascript
class Greeting extends React.Component {
	render() {
		return <h1>Hello, {this.props.name}</h1>;
	}
}
```

There are also two main rules you need to know to understand how it works.

1. **React will render your component each time its internal state changes**. And should be only like this even you can force it.
2. **React state is immutable.** So you cannot modify it directly. You will be using the `setState` method each time you need to change it.

So you can define the initial state in the
_class_ constructor method and "change it" using the
`setState` in any other method.

You can also pass information to a component via its properties. They will be available in your component in its props property.

```javascript
class Greeting extends React.Component {
    constructor(props) {
        super(props);
        this.state = {text:""};
    }
    handleChangeTheText= (event)=>{
        this.setState({text:"Lorem ipsum dolor sit amet, consectetur adipiscing elit"});
    }
    render() {
        return (
            <div>
                <h1>Hello, {this.state.text} {{this.props.endText}} </h1>
                <button onClick={this.handleChangeTheText} endText="!!" />
            </div>
        );
    }
}
```

<h2>React component lifecycle</h2>

    Probably you want to do things but you need to figure out when you can do that.
    <blockquote>When will be the component ready to be manipulated?
    How you can add functionality when the component is destroyed ?
    How to trick it when the component is already mounted ?
    </blockquote>

    This is the lifecycle of a React component and the methods you can override in your component. Each one of the methods is descriptive enough to know when it is executed, even that they are also listed in execution order.

-   <h4 style="left: -1.5rem; position: relative;display: flex; align-items: center;width: 15rem;">
             <i class="fal fa-plus-hexagon fa-2x" style="margin-right: 1rem; color: MediumSeaGreen;">* 
             Mounting
    </h4>
         A component is created and inserted into the DOM
             1. `constructor()`
             2. `componentWillMount()`
             3. `render()`
             4. `componentDidMount()`

-   <h4 style="left: -1.5rem; position: relative;display: flex; align-items: center;width: 15rem;">
            <i class="fal fa-sync fa-2x" style="margin-right: 1rem; color: Orange;">* 
            Updating
    </h4> 
        The state of the component was changed
            1. `componentWillReceiveProps()`
            2. `shouldComponentUpdate()`
            3. `componentWillUpdate()`
            4. `render()`
            5. `componentDidUpdate()`
-   <h4 style="left: -1.5rem; position: relative;display: flex; align-items: center;width: 15rem;">
            <i class="fal fa-trash-alt fa-2x" style="margin-right: 1rem; color: Tomato;">* 
            Unmounting
    </h4>
    The component is removed from the DOM
             1. `componentWillUnmount()`
        </ol>

-   <h4 style="left: -1.5rem; position: relative;display: flex; align-items: center;width: 15rem;">
            <i class="fal fa-bug fa-2x" style="margin-right: 1rem; color: IndianRed;">* 
            Error Handling
    </h4>
    An error occurred during rendering
        1. `componentDidCatch()`

<h2>Passing data between components</h2>
At the end, when you are building complex applications you'll need to nest components inside others and you should will use the component properties to pass information from parent elements to child components and the other way round.

<h3>How to pass data from a parent component to child component ?</h3>

That's the easy case so you'll write directly the property of the child element with the value from the parent. It could be a parent state attribute, an own property from the parent or simple literal value there.

```javascript
class ParentElement extends React.Component {
    constructor(props) {
        super(props);
        this.state = {text:"A parent state attribute"};
    }
    render() {
        return (
            <ChildElement propFromState={this.state.text} propFromProps={this.props.aParentProp} propLiteral="A literal">
        );
    }
}
```

<h3>How to pass data from a child component to the parent component ?</h3>
What if you want to pass data from child to parent? You should pass a parent method to the child in order to be called when the child component needs to update the parent.

```javascript
class ParentElement extends React.Component {
    constructor(props) {
        super(props);
        this.state = {text:"A parent state attribute"};
    }
    updateTheText=(text)=>{
        this.setState({text});
    }
    render() {
        return (
            <ChildElement updateWithThis={this.updateTheText} propLiteral="A literal">
        );
    }
}

class ChildElement extends React.Component {
    constructor(props) {
        super(props);
        this.state = {value:""};
    }
    handleSubmit=()=>{
        this.props.updateWithThis(this.state.text);
    }
    render() {
        return (
            <form onSubmit={this.handleSubmit}>
                <label>
                  {this.props.propLiteral}:
                  <input type="text" value={this.state.value} />
                </label>
                <input type="submit" value="Submit" />
              </form>
        );
    }
}
```

<h3>How to pass data from a component to another?</h3>

In this case you will need to use the parent component as a bridge to pass the data from a component to another using the previous examples. As you can see, as the applications grows and the complexity is increased you can start thinking of using some system or additional library to manage the store and get it in a more structured way.

<iframe height='500' scrolling='no' title='Wikipedia React viewer' src='http://codepen.io/jmtalarn/embed/jZMrqN/' frameborder='no' allowfullscreen='true' style='width: 100%;'>See the Pen <a href='https://codepen.io/jmtalarn/pen/jZMrqN/'>Wikipedia React viewer</a> by Joan Maria Talarn Espelta (<a href='https://codepen.io/jmtalarn'>@jmtalarn</a>) on <a href='https://codepen.io'>CodePen</a>.
</iframe>
