---
title: React quick overview and nested components
date: 2018-03-13T01:52:42
type: post
slug: reactjs-overview-nested-components
cover: /images/featured/reactjs-passdata.jpg
category: ['Web development']
tags: ['components', 'web', 'html', 'react', 'javascript']
author: jmtalarn
---

## What is React?

<a href="https://reactjs.org/" title="React web site" target="\_blank">React</a> (sometimes called also ReactJs) is a library to create reusable components and build with that your web applications.
Its development was leaded by
<a href="https://code.facebook.com/projects" target="\_blank">Facebook development</a> teams. Nowadays is pretty widely used around the world and there is a high demand of professionals
with knowdledge and experience with the technology.

<!--more-->
<p>
    HTML5, CSS and Javascript is almost all you need to know to start coding a web component with React. In fact, you will be
    writting JSX instead of HMTL but don't worry because is mostly the same as HTML with only some variations for reserved
    words as you are actually writting it inside your Javascript code.</p>
<p>
    <em>e.g. to define the CSS classes that applies to an element it will use
        <strong>className</strong> instead of
        <strong>class</strong> as it is the word to declare a class in Javascript</em>
</p>
<p>
    Probably you'll want to code with Javascript using the latest specifications of the language then you'll using
    <a href="https://babeljs.io/">Babel</a> together with your development with a build task.
</p>
<h2>How React works?</h2>
<p>To explain it in terms of the newly introduced
    <em>classes</em> sugar a React component isn't anything that a
    <em>class</em> extending the React component class with a
    <code>render</code> method where it returns the JSX content of your component.
</p>

```javascript
class Greeting extends React.Component {
  render() {
    return <h1>Hello, {this.props.name}</h1>
  }
}
```

<p>
    There are also two main rules you need to know to understand how it works.
    <ol>
        <li>
            <strong>React will render your component each time its internal state changes</strong>. And should be only like this
            even you can force it.</li>
        <li>
            <strong>React state is immutable.</strong> So you cannot modify it directly. You will be using the
            <code>setState</code> method each time you need to change it.</li>
    </ol>
</p>
<p>So you can define the initial state in the
    <em>class</em> constructor method and "change it" using the
    <code>setState</code> in any other method.</p>
<p>You can also pass information to a component via its properties. They will be available in your component in its props property.</p>

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
<p>
    Probably you want to do things but you need to figure out when you can do that. 
    <blockquote>When will be the component ready to be manipulated?
    How you can add functionality when the component is destroyed ? 
    How to trick it when the component is already mounted ?
    </blockquote>
    
    This is the lifecycle of a React component and the methods you can override in your component. Each one of the methods is descriptive enough to know when it is executed, even that they are also listed in execution order.
</p>
<ul style="list-style-type: none;">
    <li>
        <h4 style="left: -1.5rem; position: relative;display: flex; align-items: center;width: 15rem;">
            <i class="fal fa-plus-hexagon fa-2x" style="margin-right: 1rem; color: MediumSeaGreen;"></i> 
            Mounting
        </h4>
        <p>A component is created and inserted into the DOM</p>
        <ol>
            <li><code>constructor()</code></li>
            <li><code>componentWillMount()</code></li>
            <li><code>render()</code></li>
            <li><code>componentDidMount()</code></li>
        </ol>
    </li>
    <li>
        <h4 style="left: -1.5rem; position: relative;display: flex; align-items: center;width: 15rem;">
            <i class="fal fa-sync fa-2x" style="margin-right: 1rem; color: Orange;"></i> 
            Updating
        </h4> 
        <p>The state of the component was changed</p>
        <ol>
            <li><code>componentWillReceiveProps()</code></li>
            <li><code>shouldComponentUpdate()</code></li>
            <li><code>componentWillUpdate()</code></li>
            <li><code>render()</code></li>
            <li><code>componentDidUpdate()</code></li>
        </ol>
    </li>
    <li>
        <h4 style="left: -1.5rem; position: relative;display: flex; align-items: center;width: 15rem;">
            <i class="fal fa-trash-alt fa-2x" style="margin-right: 1rem; color: Tomato;"></i> 
            Unmounting
        </h4>
        <p>The component is removed from the DOM</p>
        <ol>
            <li><code>componentWillUnmount()</code></li>
        </ol>
    </li>
    <li>
        <h4 style="left: -1.5rem; position: relative;display: flex; align-items: center;width: 15rem;">
            <i class="fal fa-bug fa-2x" style="margin-right: 1rem; color: IndianRed;"></i> 
            Error Handling
        </h4>
        <p>An error occurred during rendering</p>
        <ol>
            <li><code>componentDidCatch()</code></li>
        </ol>
    </li>
</ul>
<h2>Passing data between components</h2>
<p>
    At the end, when you are building complex applications you'll need to nest components inside others and you should will use
    the component properties to pass information from parent elements to child components and the other way round.
</p>
<h3>How to pass data from a parent component to child component ?</h3>
<p>
 That's the easy case so you'll write directly the property of the child element with the value from the parent. It could be a parent state attribute, an own property from the parent or simple literal value there.
</p>

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
<p>What if you want to pass data from child to parent? You should pass a parent method to the child in order to be called when the child component needs to update the parent.</p>

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
<p>
In this case you will need to use the parent component as a bridge to pass the data from a component to another using the previous examples. As you can see, as the applications grows and the complexity is increased you can start thinking of using some system or additional library to manage the store and get it in a more structured way.
</p>  
<iframe height='500' scrolling='no' title='Wikipedia React viewer' src='//codepen.io/jmtalarn/embed/jZMrqN/?height=265&theme-id=light&default-tab=result&embed-version=2' frameborder='no' allowtransparency='true' allowfullscreen='true' style='width: 100%;'>See the Pen <a href='https://codepen.io/jmtalarn/pen/jZMrqN/'>Wikipedia React viewer</a> by Joan Maria Talarn Espelta (<a href='https://codepen.io/jmtalarn'>@jmtalarn</a>) on <a href='https://codepen.io'>CodePen</a>.
</iframe>
