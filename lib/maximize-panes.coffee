$ = require 'jquery'
{CompositeDisposable} = require 'atom'

module.exports =

  config:
    border:
      type: 'boolean'
      default: false
      description: 'Show dotted border around maximised pane'

  subscriptions: null

  activate: (state) ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace', 'maximize-panes:maximize': => @maximize()

  maximize: ->
    $('html').toggleClass('maximize-pane-on')
    if atom.config.get 'maximize-panes.border'
      $('atom-pane.active').toggleClass('dotted-border')

  deactivate: ->
    @subscriptions.dispose()

  serialize: ->
