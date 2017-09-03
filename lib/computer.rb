require './lib/gameboard'

class Computer

  def initialize
    @winner = false
    @health = health
    @compboard = GameBoard.new
  end

  def chooses_first_spot_two_boat
    compboard.board.keys.sample
  end

  def chooses_second_based_on_first_spot_two_boat
    
  end

end
