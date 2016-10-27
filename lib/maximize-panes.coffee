$ = require 'jquery'
{CompositeDisposable} = require 'atom'

module.exports =
  subscriptions: null
  treeView: null
  restoreTreeView: false

  activate: (state) ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace', 'maximize-panes:maximize': => @maximize()

  maximize: ->
    $('html').toggleClass('maximize-pane-on')
    @treeView = @getTreeView()
    if @treeView?
      if $('html').hasClass('maximize-pane-on') and @treeView.panel?
        @treeView.detach()
        @restoreTreeView = true
      else if @restoreTreeView
        @treeView.attach()
        @restoreTreeView = false

  deactivate: ->
    @subscriptions.dispose()

  serialize: ->

  getTreeView: ->
    if not @treeView?
      if atom.packages.getActivePackage('tree-view')?
        treeViewPkg = atom.packages.getActivePackage('tree-view')
      if treeViewPkg?.mainModule?.treeView?
        return treeViewPkg.mainModule.treeView
      else
        return null
    else
      return @treeView
