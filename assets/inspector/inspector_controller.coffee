#= require ./inspector_panel_view
#= require ./composition_panel_view
#= require ./undo_panel_view

class Trix.InspectorController
  constructor: (@element, @editorController) ->
    @toolbarElement = @element.querySelector(".trix-inspector-toolbar")
    @toolbarElement.addEventListener("change", @didClickToolbarButton)

    @activePanelView = null
    @activatePanel("attachments")

  didClickToolbarButton: (event) =>
    @activatePanel(event.target.value)

  activatePanel: (name) ->
    inputElement = @findInputElement(name)
    inputElement.checked = "checked"

    @activePanelView?.hide()
    @activePanelView = @createViewForPanel(name)
    @activePanelView.show()

  createViewForPanel: (name) ->
    element = @findPanelElement(name)
    className = element.getAttribute("data-inspector-panel-view") ? "InspectorPanelView"
    new Trix[className] element, @editorController

  findInputElement: (name) ->
    @element.querySelector("input[value=#{name}]")

  findPanelElement: (name) ->
    @element.querySelector("[data-inspector-panel-name=#{name}]")

  render: ->
    @activePanelView?.render()
