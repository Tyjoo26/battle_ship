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

    assert_equal true, computer.ai_place_two_unit
  end

end
