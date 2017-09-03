require 'minitest/autorun'
require 'minitest/pride'
require './lib/battleship.rb'
require 'pry'

class BattleShipTest < MiniTest::Test

  def test_it_exist
    battleship = BattleShip.new

    assert_instance_of BattleShip, battleship
  end

  def test_welcome_message
    battleship = BattleShip.new


  end

  def test_case_name

  end


end
