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


  def test_computer_count_placed_keys
    computer = Computer.new

    assert_equal 5, computer.validate_all_boat_coordinates.count
  end




end
