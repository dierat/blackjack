# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.

# App model should contain persistant data (chips, win/loss, etc)
class window.App extends Backbone.Model
  initialize: ->
    @set 'game', game = new Game()

    @set 'wins', 0

    @set 'losses', 0

    @set 'ties', 0

    @set 'chips', 0
