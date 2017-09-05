require 'minitest/autorun'
require 'minitest/pride'
require './lib/gameboard'
require './lib/player'
require 'pry'

class PlayerTest < MiniTest::Test
  def test_it_exist
    player = Player.new

    assert_instance_of Player, player
  end

  def test_it_has_winner_variable
    player = Player.new

    refute player.winner
  end


end
