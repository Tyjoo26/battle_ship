require 'minitest/autorun'
require 'minitest/pride'
require './lib/gameboard'
require './lib/player'


class PlayerTest < MiniTest::Test
  def test_it_exist
    player = Player.new

    assert_instance_of Player, player
  end

  def test_it_has_winner_variable
    player = Player.new

    refute player.winner
  end

  def test_it_has_health_variable
    player = Player.new

    assert_equal 5, player.health
  end

  def test_it_has_a_gameboard
    player = Player.new

    assert_instance_of GameBoard, player.board
  end





end
