require 'minitest/autorun'
require 'minitest/pride'
require './lib/computer'
require './lib/gameboard'


class ComputerTest < MiniTest::Test
  def test_does_it_exist
    computer = Computer.new

    assert_instance_of Computer, computer
  end

  def test_it_has_winner_instance_variable
    computer = Computer.new

    refute  computer.winner
  end

  def test_it_has_health
    computer = Computer.new

    assert_equal 5, computer.health
  end

  def test_computer_place_two_unit
    computer = Computer.new

    assert_equal 2, computer.choose_two_boat.count
  end

  def test_validate_boat_coordinates
    computer = Computer.new

    
  end

  def test_computer_count_full_values_for_two_boat
    computer = Computer.new
    computer.change_grid_to_show_placement(["A1", "A2"], ["B1","B2", "B3"])
    actual = computer.gameboard.board.values.count("full")

    assert_equal 5, actual
  end




end
