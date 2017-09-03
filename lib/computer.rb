require './lib/gameboard'

class Computer

  attr_reader :gameboard

  def initialize
    @winner = false
    @health = 5
    @gameboard = GameBoard.new
  end

  def chooses_first_spot_two_boat
    @gameboard.board.keys.sample
  end

  def board_second_space_two_boat
    {"A1" => ["A2", "B1"], "A2" => ["A1", "A3", "B2"],
    "A3" => ["A2", "A4", "B3"], "A4" => ["A3", "B4"],
    "B1" => ["A1", "B2", "C1"], "B2" => ["A2", "B1", "B3", "C2"],
    "B3" => ["A3", "B2", "B4", "C3"], "B4" => ["A4", "B3", "C4"],
    "C1" => ["B1", "C2", "D1"], "C2" => ["B2", "C1", "C3", "D2"],
    "C3" => ["B3", "C2", "C4", "D3"], "C4" => ["B4", "C3", "D4"],
    "D1" => ["C1", "D2"], "D2" => ["C2", "D1", "D3"],
    "D3" => ["C3", "D2", "D4"], "D4" => ["C4", "D3"]
    }
  end

  def choose_second_spot_two_boat
    a = board_second_space_two_boat[chooses_first_spot_two_boat]
    array = []
    array << chooses_first_spot_two_boat
    array << a
  end

  def change_grid_to_show_two_boat_placement
    a = choose_second_spot_two_boat[0]
    b = choose_second_spot_two_boat[1]
    @gameboard.board[a] = "full"
    @gameboard.board[b] = "full"
    @gameboard.board
  end


end
