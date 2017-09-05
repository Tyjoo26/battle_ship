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

  def test_computer_count_full_values_for_two_boat
    computer = Computer.new
    computer.change_grid_to_show_two_boat_placement
    actual = computer.gameboard.board.values.count("full")

    assert_equal 2, actual
  end


  def test_computer_count_full_values_for_three_boat
    computer = Computer.new
    computer.place_three_boat_on_grid_with_two_boat
    actual = computer.gameboard.board.values.count("full")

    assert_equal 5, actual
  end

end
