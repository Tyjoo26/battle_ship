require './lib/gameboard'

class Computer

  attr_reader :gameboard

  def initialize
    @winner = false
    @health = 5
    @gameboard = GameBoard.new
  end

  def choose_first_spot
    @gameboard.board.keys.sample
  end

  def board_second_space
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


  def board_third_space
      {["A1", "A2"] => ["A3"], ["A2", "A3"] => ["A1", "A4"],
      ["A3", "A4"] => ["A2"], ["A1", "B1"] => ["C1"],
      ["A2", "B2"] => ["C2"], ["A3", "B3"] => ["C3"],
      ["A4", "B4"] => ["C4"], ["B1", "B2"] => ["B3"],
      ["B2", "B3"] => ["B1", "B4"], ["B3", "B4"] => ["B2"],
      ["B1", "C1"] => ["A1", "D1"], ["B2", "C2"] => ["A2", "D2"],
      ["B3", "C3"] => ["A3", "D3"], ["B4", "C4"] => ["A4", "D4"],
      ["C1", "C2"] => ["C3"], ["C2", "C3"] => ["C1", "C4"],
      ["C3", "C4"] => ["C2"], ["C1", "D1"] => ["B1"],
      ["C2", "D2"] => ["B2"], ["C3", "D3"] => ["B3"],
      ["C4", "D4"] => ["B4"], ["D1", "D2"] => ["D3"],
      ["D2", "D3"] => ["D1", "D4"], ["D3", "D4"] => ["D2"]
      }
  end


  def choose_second_spot
    x = choose_first_spot
    y = board_second_space[x]
    z = y.sample
    array = []
    array << x
    array << z
    array = array.sort
  end

  def change_grid_to_show_two_boat_placement
    x = choose_second_spot
    a = x[0]
    b = x[1]
    @gameboard.board[a] = "full"
    @gameboard.board[b] = "full"
    @gameboard.board
  end


  def choose_third_spot_three_boat
    x = choose_second_spot
    y = board_third_space[x]
    z = y.sample
    array = []
    array << x
    array << z
    array = array.flatten.sort
  end

  def change_grid_to_show_all_boat_placement
    change_grid_to_show_two_boat_placement
    x = choose_third_spot_three_boat
    a = x[0]
    b = x[1]
    c = x[2]
    @gameboard.board[a] = "full"
    @gameboard.board[b] = "full"
    @gameboard.board[c] = "full"
    @gameboard.board
  end






end
