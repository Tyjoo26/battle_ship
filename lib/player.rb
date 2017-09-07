require './lib/gameboard'
require './lib/computer'

class Player

  attr_reader :winner, :health, :board

  def initialize
    @winner = false
    @health = 5
    @board = GameBoard.new
  end

  def fire_shot
    user_input = gets.chomp
  end

  def record_player_shot_as_hit_or_miss(computer_board)
    if comp.board[fire_shot] == " two " || comp.board[fire_shot] == " three"
      comp.board[fire_shot] = "  H  "
    else
      comp.board[fire_shot] = "  M  "
    end
  end

  def is_ship_sunk?
    if comp.board.values.count("two") == 0
      p "Patrol boat is destroyed!"
    elsif comp.board.values.count("three") == 0
      p "Destroyer boat is destroyed"
    end
  end

  def is_winner?
    if comp.board.values.count("two") && comp.board.values.count("three") == 0
      p "You've won the game! Take a victory lap!!!"
    end
  end


end
