class Trix.InspectorPanelView
  constructor: (@element, @editorController) ->

  render: ->

  show: ->
    @render()
    @element.style.display = "block"

  hide: ->
    @element.style.display = ""
