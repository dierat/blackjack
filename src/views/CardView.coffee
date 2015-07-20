class window.CardView extends Backbone.View
  className: 'card'

  template: _.template '<div class="card-background" style="background-image: url(<%= bg %>)"><%= rankName %> of <%= suitName %></div>'

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'

