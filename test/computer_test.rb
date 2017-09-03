require 'minitest/autorun'
require 'minitest/pride'
require './lib/computer'
require './lib/gameboard'


class ComputerTest < MiniTest::Test
  def test_does_it_exist
    computer = Computer.new

    assert_instance_of Computer, computer
  end

  def test_computer_place_two_unit
    computer = Computer.new

    assert_equal 2, computer.choose_second_spot_two_boat.count
  end

  def test_computer_count_full_values
    computer = Computer.new
    computer.change_grid_to_show_two_boat_placement
    actual = computer.gameboard.board.values.count("full")

    assert_equal 2, actual
    binding.pry
  end

end
