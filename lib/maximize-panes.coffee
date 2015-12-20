$ = require 'jquery'
{CompositeDisposable} = require 'atom'

module.exports =
  activate: (state) ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace', 'maximize-panes:maximize': => @maximize()

  maximize: ->
    $('html').toggleClass('maximize-pane-on')

  deactivate: ->
    @subscriptions.dispose()

  serialize: ->
