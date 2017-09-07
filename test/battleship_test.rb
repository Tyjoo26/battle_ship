require 'minitest/autorun'
require 'minitest/pride'
require './lib/battleship.rb'

class BattleShipTest < MiniTest::Test

  def test_it_exist
    battleship = BattleShip.new

    assert_instance_of BattleShip, battleship
  end






end
