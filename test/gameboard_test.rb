require 'minitest/autorun'
require 'minitest/pride'
require './lib/gameboard.rb'
require 'pry'

class GameBoardTest < MiniTest::Test
  def test_it_exist
    gameboard = GameBoard.new

    assert_instance_of GameBoard, gameboard
  end

  def test_can_place_two_unit_ship_horizontal
    gameboard = GameBoard.new
    gameboard.place_two_unit("A1", "A2")

    assert_equal "full", gameboard.board["A1"]
    assert_equal "full", gameboard.board["A2"]
  end

  def test_can_validate_two_unit_ship_vertical
    gameboard = GameBoard.new
    gameboard.place_two_unit("A1", "B1")

    assert_equal "full", gameboard.board["A1"]
    assert_equal "full", gameboard.board["B1"]
  end

  def test_cant_validate_outside_board
   gameboard = GameBoard.new

   gameboard.check_nil("C4", "C5")
   assert_nil  gameboard.board["C5"]
  end


  def test_cant_validate_outside_first_space_two_boat
    gameboard = GameBoard.new

    gameboard.check_nil("D5", "D4")

    assert_nil  gameboard.board["D5"]
    assert_equal "", gameboard.board["D4"]
  end


  def test_cant_set_in_non_consecutive_vertical_spots
    gameboard = GameBoard.new

    assert_equal false, gameboard.place_two_unit("A1", "C1")
  end

  def test_non_consecutive_horizontal_spot_two_boat
    gameboard = GameBoard.new

    assert_equal false, gameboard.place_two_unit("A1", "A3")
    assert_equal false, gameboard.place_two_unit("A1", "A4")
  end

  def test_reverse_non_consecutive_two_boat_vertical
    gameboard = GameBoard.new

    assert_equal false, gameboard.place_two_unit("D1", "B1")
  end

  def test_reverse_non_consecutive_two_boat_horizontal
    gameboard = GameBoard.new

    assert_equal false, gameboard.place_two_unit("D4", "D2")
  end

  def test_cant_place_two_unit_diagonally
    gameboard = GameBoard.new

    assert_equal false, gameboard.cant_place_diagonally_two("A1", "B2")
  end

  def test_two_unit_diagonally_again
    gameboard = GameBoard.new

    assert_equal false, gameboard.cant_place_diagonally_two("B2", "C3")
  end

  def test_place_three_unit_ship
    gameboard = GameBoard.new

    gameboard.place_three_unit("D1", "D2", "D3")
    assert_equal "full", gameboard.board["D1"]
    assert_equal "full", gameboard.board["D2"]
    assert_equal "full", gameboard.board["D3"]
  end


  def test_cant_place_outside_board_three_boat
    gameboard = GameBoard.new

    gameboard.place_three_unit("B5", "B4", "B3")
    refute gameboard.cant_place_outside_board("B5","B4","B3")
  end

  def test_cant_place_three_boat_diagonally
    gameboard = GameBoard.new


    assert_equal false, gameboard.cant_place_diagonally("A1", "B2", "C2")
  end

  def test_can_place_consecutive_vertical_three_boat
    gameboard = GameBoard.new

    assert_equal true, gameboard.place_three_unit("A1","B1","C1")
  end

  def test_cant_place_longer_than_three
    gameboard = GameBoard.new

    assert_equal false, gameboard.cant_place_longer_than_three("B1","B2","B4")
  end

  def test_cant_overlay_two_unit
    gameboard = GameBoard.new

    assert_equal false, gameboard.cant_overlay_two_unit("A1", "A1")
  end

  def test_cant_overlay_three_unit
    gameboard = GameBoard.new

    assert_equal false, gameboard.cant_overlay_three_unit("A1","B1","B1")
  end

  def test_cant_wrap_horizontally_two_unit

    gameboard = GameBoard.new

    assert_equal false, gameboard.cant_wrap_horizontally_two_unit("A4", "A1")
    assert_equal false, gameboard.cant_wrap_horizontally_two_unit("B4", "B1")
  end

  def test_cant_wrap_vertically_two_unit
    gameboard = GameBoard.new

    assert_equal false, gameboard.cant_wrap_vertically_two_unit("D1", "A1")
    assert_equal false, gameboard.cant_wrap_vertically_two_unit("D3", "A3")
    assert_equal false, gameboard.cant_wrap_vertically_two_unit("D4", "A4")
  end

  def test_cant_wrap_horizontally_three_unit
    gameboard = GameBoard.new

    assert_equal false, gameboard.cant_wrap_horizontally_three_unit("D4","D1", "D2")
    assert_equal false, gameboard.cant_wrap_horizontally_three_unit("A4","A1", "A2")
  end

  def test_cant_wrap_vertically_three_unit
    gameboard = GameBoard.new

    assert_equal false, gameboard.cant_wrap_vertically_three_unit("D1", "A1", "B1")
  end


end
