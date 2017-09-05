require './lib/gameboard'

class Computer

  attr_reader :gameboard, :winner

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


  def choose_two_boat
    x = choose_first_spot
    y = board_second_space[x].sample
    array = []
    array << x
    array << y
    array = array.sort
  end

  def change_grid_to_show_two_boat_placement
    x = choose_two_boat
    a = x[0]
    b = x[1]
    @gameboard.board[a] = "full"
    @gameboard.board[b] = "full"
    @gameboard.board
  end

  def place_first_three_boat
    x = choose_two_boat

  end

  # def place_first_space_three_boat
  #   x = choose_first_spot
  #   y = choose_two_boat
  #   until choose_two_boat.include?(x) == false
  #     place_first_space_three_boat
  #   end
  #     x
  #   end
  #
  # def place_second_space_three_boat
  #   y = board_second_space[place_first_space_three_boat].sample
  #   until choose_two_boat.include?(y) == false
  #     place_second_space_three_boat
  #   end
  #     array = []
  #     array << place_first_space_three_boat
  #     array << y
  #     array = array.flatten.sort
  #     binding.pry
  # end
  #
  # def place_third_space_three_boat
  #   z = board_third_space[place_second_space_three_boat]
  #   z = z.sample
  #   until choose_two_boat.include?(z) == false
  #     place_third_space_three_boat
  #   end
  #     place_second_space_three_boat << z
  #     binding.pry
  # end


  def place_three_boat_on_grid_with_two_boat
    change_grid_to_show_two_boat_placement
    x = place_third_space_three_boat
    a = x[0]
    b = x[1]
    c = x[2]
    @gameboard.board[a] = "full"
    @gameboard.board[b] = "full"
    @gameboard.board[c] = "full"
    @gameboard.board
  end

  # def check_if_two_boat_and_three_boat_overlap
  #   !(choose_second_spot & choose_third_spot_three_boat).empty?
  # end

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
