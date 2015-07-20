class window.AppView extends Backbone.View
  className: 'appView'

  template: _.template '
    <h1>Blackjack</h1>
    <div class="stats">
      <div class="win-loss">Games won/lost: <%= wins %> / <%= losses %></div>
      <div class="win-loss">Games ties: <%= ties %></div>
      <div class="chips">Chips: <%= chips %></div> 
    </div>
    <div class="gameview-container"></div>
  '
  
  initialize: ->
    @render()

    @model.on 'change:game', =>
      @render()

  render: ->
    # adds a new gameview into the DOM
    @$el.children().detach()
    @$el.html @template( @model.attributes )
    @$('.gameView-container').html new GameView(model: @model.get 'game').el
