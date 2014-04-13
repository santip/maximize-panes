$ = require 'jquery'

module.exports =
  activate: (state) ->
    atom.workspaceView.command "maximize-panes:maximize", => @maximize()

  maximize: ->
    $('html').toggleClass('maximize-pane-on')

  deactivate: ->

  serialize: ->
