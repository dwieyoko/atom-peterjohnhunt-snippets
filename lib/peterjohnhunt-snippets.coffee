PeterjohnhuntSnippetsView = require './peterjohnhunt-snippets-view'
{CompositeDisposable} = require 'atom'

module.exports = PeterjohnhuntSnippets =
  peterjohnhuntSnippetsView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @peterjohnhuntSnippetsView = new PeterjohnhuntSnippetsView(state.peterjohnhuntSnippetsViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @peterjohnhuntSnippetsView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'peterjohnhunt-snippets:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @peterjohnhuntSnippetsView.destroy()

  serialize: ->
    peterjohnhuntSnippetsViewState: @peterjohnhuntSnippetsView.serialize()

  toggle: ->
    console.log 'PeterjohnhuntSnippets was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
