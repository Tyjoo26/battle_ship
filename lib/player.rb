require './lib/gameboard'

class Player

  attr_reader :winner, :health, :board

  def initialize
    @winner = false
    @health = 5
    @board = GameBoard.new
  end




end
