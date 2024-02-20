---
title: Building a JSF composite component
date: 2016-07-16T20:58:38
type: post
slug: building-a-jsf-composite-component
cover: /images/featured/Sense-t-tol.png
category: ["Web development"]
tags: ["jsf", "java", "components"]
author: jmtalarn
---

Since the version 2.2 of the JSF specification build composite components is a really easy thing to do. I will describe here how we implemented one to reuse a piece of UI in many pages.

From the answer of this <a href="http://stackoverflow.com/questions/6358066/how-to-implement-a-dynamic-list-with-a-jsf-2-0-composite-component" target="_blank"><i class="fab fa-stack-overflow">\* StackOverflow question</a> I'd learned about how to create the \*java\* part of this example.

<!--more-->
<h1 id="herethereistheexample">Here is the example.</h1>
This is a HTML5 canvas showing a map where you can drag and drop elements like a treasure, a house or a plant from a toolbar over it.

The position of the items will be written on a table that is the data whith the backing bean will work.

And in the same way you can edit the table of the elements over the represented map.

There are some parameters like the size of the component or the background image for the map.

For most of the components used I worked with the <a href="http://www.primefaces.org/showcase/index.xhtml">PrimeFaces components</a> and to take advantage of the use of the data attributes from html5 with the xhtml specification I added the use of the <a href="http://docs.oracle.com/javaee/7/javaserver-faces-2-2/vdldocs-facelets/p/tld-summary.html">passthrough library</a>

<h2 id="xhtml">xhtml</h2>
This is the component xhtml code placed under the resources folder in WebContent **webcontent/resources/mapoftreasure/**

In this folder there should be also all the assets needed for the component like the javascript included or the images referenced.

```xml
<html xmlns="http://www.w3.org/1999/xhtml"
xmlns:ui="http://java.sun.com/jsf/facelets"
      xmlns:a="http://xmlns.jcp.org/jsf/passthrough"
      xmlns:h="http://java.sun.com/jsf/html"
      xmlns:f="http://java.sun.com/jsf/core"
      xmlns:p="http://primefaces.org/ui"
      xmlns:composite="http://java.sun.com/jsf/composite">

<composite:interface componentType="mapOfTreasureCanvas">
<composite:attribute name="id" />
<composite:attribute name="width" default="550" />
<composite:attribute name="height" default="260" />
<composite:attribute name="style" default="" />
<composite:attribute name="mapBackground" default="island" />
<composite:attribute name="things" type="java.util.List" />
</composite:interface>

<composite:implementation>
<h:outputScript library="mapoftreasure" name="canvasdefault.js" />
<h:outputScript library="mapoftreasure" name="thing.js" />
<style>
  .toolbarthing {
      margin-right: 1em;
  }

  .thing.hover {
      box-shadow: 0px 0px 10px #fc6500;
  }

  tbody tr[role=row].hover {
      background-color: rgba(252, 101, 0, 0.2) !important;
  }

  .trash-thing {
      float: right;
  }

  .padding-0 .ui-panel-content {
      padding: 0;
  }

  .smallRowEditor .ui-row-editor {
      float: left;
  }

  .positionMarker {
      position: relative;
      font-size: 0.6em;
      top: 0;
      display: inline-block;
      float: right;
  }

  .trashThings {
      padding: 0.5em;
      bottom: 0;
      display: inline-block;
      position: absolute;
      right: 0;
  }
</style>

<p:panel header="Drag things over the map" class="padding-0 " style="width: #{cc.attrs.width}px;">
  <f:facet name="actions">
      <h:graphicImage id="treasure_tool" title="Treasure" alt="Treasure" library="mapoftreasure" name="treasure.png" a:data-type="treasure" a:data-canvas="#{cc.id}" styleClass="toolbarthing #{cc.id} treasure" />
      <h:graphicImage id="house_tool" title="House" alt="House" library="mapoftreasure" name="house.png" a:data-type="house" a:data-canvas="#{cc.id}" styleClass="toolbarthing #{cc.id} house" />
      <h:graphicImage id="plant_tool" title="Plant" alt="Plant" library="mapoftreasure" name="plant.png" a:data-type="plant" a:data-canvas="#{cc.id}" styleClass="toolbarthing #{cc.id} plant" />
      <h:graphicImage id="rock_tool" title="Rock" alt="Rock" library="mapoftreasure" name="rock.png" a:data-type="rock" a:data-canvas="#{cc.id}" styleClass="toolbarthing #{cc.id} rock" />
  </f:facet>


  <div id="#{cc.id}" style="background-cover: /images url(#{request.contextPath}/resources/mapoftreasure/#{cc.attrs.mapBackground}.jpg); background-size: cover; #{cc.attrs.style}; width: #{cc.attrs.width}px; height:#{cc.attrs.height}px; position: relative; ">
      <div id="posX-posY" class="positionMarker"> </div>
      <h:outputText id="trashThings" styleClass="fa fa-trash fa-2x trashThings" a:data-canvas="#{cc.id}" title="Drop to remove thing"></h:outputText>
  </div>
</p:panel>
<p:panel header="View the data" class="padding-0 smallRowEditor" collapsed="true" toggleable="true" style="width: #{cc.attrs.width}px;">
  <h:form id="#{cc.id}_form">
      <p:dataTable id="#{cc.id}_data" value="#{cc.model}" var="d" rowIndexVar="index" editable="true" style="width: #{cc.attrs.width}px;">

          <p:ajax event="rowEdit" update="#{cc.id}_data" oncomplete="canvasDefault.js.drawThingsFromTable('#{cc.id}')" />

          <p:column headerText="Type" type="type">
              <h:outputText id="type" value="#{d.type}" />
              <f:facet name="footer">
                  <h:selectOneMenu id="newThingType" value="#{cc.newThing.type}">
                      <f:selectItem itemLabel="House" itemValue="house" />
                      <f:selectItem itemLabel="Treasure" itemValue="treasure" />
                      <f:selectItem itemLabel="Plant" itemValue="plant" />
                      <f:selectItem itemLabel="Rock" itemValue="rock" />
                  </h:selectOneMenu>
              </f:facet>
          </p:column>

          <p:column headerText="X" type="posX">
              <p:cellEditor>
                  <f:facet name="output">
                      <h:outputText id="posXLabel" value="#{cc.attrs.things[index].posX}" />
                  </f:facet>
                  <f:facet name="input">
                      <p:inputText id="posXInput" value="#{cc.attrs.things[index].posX}" />
                  </f:facet>
              </p:cellEditor>
              <f:facet name="footer">
                  <p:inputText id="newPosXInput" value="#{cc.newThing.posX}" />
              </f:facet>
          </p:column>

          <p:column headerText="Y" type="posY">
              <p:cellEditor>
                  <f:facet name="output">
                      <h:outputText id="posYLabel" value="#{cc.attrs.things[index].posY}" />
                  </f:facet>
                  <f:facet name="input">
                      <p:inputText id="posYInput" value="#{cc.attrs.things[index].posY}" />
                  </f:facet>
              </p:cellEditor>
              <f:facet name="footer">
                  <p:inputText id="newPosYInput" value="#{cc.newThing.posY}" />
              </f:facet>
          </p:column>
          <p:column>
              <p:rowEditor id="rowEditor" />

              <p:commandLink id="deleteLink" styleClass="ui-icon ui-icon-trash" action="#{cc.remove}" update="#{cc.id}_data" oncomplete="canvasDefault.js.drawThingsFromTable('#{cc.id}')" />


              <f:facet name="footer">
                  <p:commandButton value="add" action="#{cc.add}" update="@form" oncomplete="canvasDefault.js.drawThingsFromTable('#{cc.id}')" />
              </f:facet>
          </p:column>

      </p:dataTable>
  </h:form>
</p:panel>

<script>
  canvasDefault.js.init('#{cc.id}');
</script>

</composite:implementation>

</html>
```

<h2 id="java">java</h2>
This is the component java code **source package**

As you can see, the value of the FacesComponent annotation is the component type we specified in the componentType attribute in the composite interface definition in the xhtml.

The great thing here is that you can access the values in the attributes of the component and work with them in the backend. You can access database or external APIs to query or, by the way, make big calculations that you want to avoid to do in the client.

The methods created here will be accessible in the xhtml part using the cc._nameofthemethod_ like the add and remove methods or the list of data you can access to draw all the _things_ over the map.

```java
package mapoftreasures.factory.web.component;

import mapoftreasures.factory.domain.Thing;
import java.util.List;
import javax.faces.component.FacesComponent;
import javax.faces.component.UINamingContainer;
import javax.faces.model.DataModel;
import javax.faces.model.ListDataModel;

@FacesComponent(value="mapOfTreasureCanvas") // To be specified in componentType attribute.
@SuppressWarnings({"rawtypes", "unchecked"}) // We don't care about the actual model item type anyway.
public class mapOfTreasureCanvas extends UINamingContainer {

    private transient DataModel model;

    private Thing newThing = new Thing();

    public void add() {
        getList().add(newThing);
        newThing = new Thing();
    }

    public void remove() {
        getList().remove(model.getRowData());
    }

    public DataModel getModel() {
        if (model == null) model = new ListDataModel(getList());
        return model;
    }

    private List getList() { // Don't make this method public! Ends otherwise in an infinite loop calling itself everytime.
        return (List) getAttributes().get("things");
    }

    public Thing getNewThing() {
        return newThing;
    }

    public void setNewThing(Thing newThing) {
        this.newThing = newThing;
    }

}
```

<h2 id="exampleofuse">Example of use</h2>
This is how to use the component in your xhtml page.

```html
<!DOCTYPE html>
<html
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:h="http://xmlns.jcp.org/jsf/html"
	xmlns:f="http://xmlns.jcp.org/jsf/core"
	xmlns:p="http://primefaces.org/ui"
	xmlns:ui="http://xmlns.jcp.org/jsf/facelets"
	xmlns:pt="http://xmlns.jcp.org/jsf/passthrough"
	xmlns:sec="http://www.springframework.org/security/tags"
>
	<h:head></h:head>
	<h:body>
		<ui:composition
			template="/xhtml/index.xhtml"
			xmlns:dn="http://java.sun.com/jsf/composite/mapoftreasure"
		>
			<ui:define name="content">
				<style></style>
				<div class="ui-grid ui-grid-responsive">
					<div class="ui-grid-row">
						<div class="ui-grid-col-4">
							<dn:canvas
								id="canvas"
								things="#{thingsView.things}"
							></dn:canvas>
						</div>
					</div>
					<div class="ui-grid-row">
						<div class="ui-grid-col-4">
							<dn:canvas
								id="city_map"
								width="550"
								height="260"
								mapBackground="city"
							></dn:canvas>
						</div>
					</div>
				</div>
				<div class="ui-grid-row">
					<div>
						<canvas id="canvasExample" width="400" height="300">
							This text is displayed if your browser does not
							support HTML5 Canvas.
						</canvas>
					</div>
				</div>
			</ui:define>
		</ui:composition>
	</h:body>
</html>
```
