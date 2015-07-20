# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.

# App model should contain persistant data (chips, win/loss, etc)
class window.App extends Backbone.Model
  initialize: ->
    @newGame()

    @set 'wins', 0

    @set 'losses', 0

    @set 'ties', 0


  # to create new games on command, you make a newGame function that encapsulates making a new game and also creating the event listeners for win, lose, and tie, which will call this newGame function
  newGame: ->
    @set 'game', game = new Game()

    @get('game').on 'newGame', =>
      @newGame()    

    @get('game').on 'win', =>
      wins = @get 'wins'
      @set 'wins', wins + 1
      @newGame()
    
    @get('game').on 'lose', =>
      losses = @get 'losses'
      @set 'losses', losses + 1
      @newGame()

    @get('game').on 'push', =>
      ties = @get 'ties'
      @set 'ties', ties + 1
      @newGame()
