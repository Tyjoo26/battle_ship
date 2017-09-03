require 'pry'

class GameBoard

  attr_reader :board

  def initialize
    @board = {
      "A1" => "empty", "A2" => "empty", "A3" => "empty", "A4" => "empty",
      "B1" => "empty", "B2" => "empty", "B3" => "empty", "B4" => "empty",
      "C1" => "empty", "C2" => "empty", "C3" => "empty", "C4" => "empty",
      "D1" => "empty", "D2" => "empty", "D3" => "empty", "D4" => "empty" }
  end

  def present_board_with_headers
    @board
  end

  def check_nil(space_1, space_2)
    if board[space_2] == nil || board[space_1] == nil
      return false
    else
      place_two_unit(space_1, space_2)
    end
  end

  def cant_place_diagonally_two(space_1, space_2)
    a = space_1.split(//)[1].to_i
    b = space_2.split(//)[1].to_i
    if a != b
      return false
    end
  end

  def place_two_unit(space_1, space_2)
    a = space_1.split(//)[1].to_i
    b = space_2.split(//)[1].to_i

    x = space_1.split(//)[0].ord
    y = space_2.split(//)[0].ord


    if b - a > 1 || a - b > 1 || x - y > 1 || y - x > 1
      return false
    else
      board[space_1] = "full"
      board[space_2] = "full"
      true
    end
  end

def place_three_unit(space_1, space_2, space_3)
    board[space_1] = "full"
    board[space_2] = "full"
    board[space_3] = "full"
    true
  end

  def cant_place_outside_board(space_1, space_2, space_3)
    if board[space_3] == nil || board[space_1] == nil
      return false
    end
  end

  def cant_place_diagonally(space_1, space_2, space_3)
    a = space_1.split(//)[1].to_i
    b = space_2.split(//)[1].to_i
    c = space_3.split(//)[1].to_i

    if a != b
      return false
    end
  end

  def cant_place_longer_than_three(space_1, space_2, space_3)
    a = space_1.split(//)[1].to_i
    b = space_3.split(//)[1].to_i

    if b - a > 2 || a - b > 2
      return false
    end
  end




end
gameboard = GameBoard.new
gameboard.present_board_with_headers
