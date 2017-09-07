require './lib/computer'
require './lib/player'
require './lib/gameboard'
require 'pry'

class BattleShip

  attr_accessor :player, :comp, :gameboard, :input

  def initialize
    @player = Player.new
    @comp = Computer.new
    @gameboard = GameBoard.new
    @input = input
  end

  def start_game
  welcome_message
  user_input = gets.chomp.downcase
    if user_input == "p"
      initiate_game
    elsif user_input == "i"
      instructions
    else user_input == "q"
      p "You've exited the game"
    end
  end

  def welcome_message
  p "Welcome to BATTLESHIP"

  p "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def instructions
    p "You will need to place your ships on a grid by typing in coordinates(eg: A1, A2). Your ship cannot be placed outside of the grid, diagonally, or overlapping. You and the computer will alternate turns taking guesses at a game grid to sink the opposings players ships. Do you want to (p)lay or (q)uit?"
    user_input = gets.chomp.downcase
    if user_input == "p"
      initiate_game
    elsif user_input == "q"
      p "You've exited the game"
    else
      p "Invalid option, try again"
      instructions
    end
  end

  def initiate_game
    @comp.validate_all_boat_coordinates
    computer_placement_message
    convert_input_for_validation_two_boat
    update_game_board_to_reflect_placement
    @comp.fire_shot_at_player(player.board)
    @comp.record_player_shot_as_hit_or_miss(player.board)
  end


  def convert_input_for_validation_two_boat
    user_input = gets.chomp
    @input = user_input.split(" ").sort
    patrol_first
    patrol_second
    validate_two_boat_diagonally(patrol_first, patrol_second)
    until validate_two_boat_diagonally == true
      convert_input_for_validation_two_boat
    end
  end


  def patrol_first
    @input[0]
  end

  def patrol_second
    @input[1]
  end

  def validate_two_boat_diagonally(patrol_first, patrol_second)
    if @gameboard.cant_place_diagonally_two(patrol_first, patrol_second) == false
      invalid_coordinate_message_two_boat
    else
      validate_two_boat_cant_overlay(patrol_first, patrol_second)
    end
  end

  def validate_two_boat_cant_overlay(patrol_first, patrol_second)
    if @gameboard.cant_overlay_two_unit(patrol_first, patrol_second) == false
      invalid_coordinate_message_two_boat
    else
      validate_two_boat_cant_wrap_horizontally(patrol_first, patrol_second)
    end
  end

  def validate_two_boat_cant_wrap_horizontally(patrol_first, patrol_second)
    if @gameboard.cant_wrap_horizontally_two_unit(patrol_first, patrol_second) == false
      invalid_coordinate_message_two_boat
    else
      validate_two_boat_cant_wrap_vertically(patrol_first, patrol_second)
    end
  end

  def validate_two_boat_cant_wrap_vertically(patrol_first, patrol_second)
    if @gameboard.cant_wrap_vertically_two_unit(patrol_first, patrol_second) == false
      invalid_coordinate_message_two_boat
    else
      validate_two_boat_check_nil(patrol_first, patrol_second)
    end
  end

  def validate_two_boat_check_nil(patrol_first, patrol_second)
    if @gameboard.check_nil(patrol_first, patrol_second) == false
      invalid_coordinate_message_two_boat
    else
      validate_two_boat(patrol_first, patrol_second)
    end
  end

  def validate_two_boat(patrol_first, patrol_second)
    if @gameboard.place_two_unit(patrol_first, patrol_second) == false
      invalid_coordinate_message_two_boat
    else
      success_two_boat_placement_message
    end
  end

  def invalid_coordinate_message_two_boat
    p "Invalid coordinates! Please try again!"
    convert_input_for_validation_two_boat
  end

  def success_two_boat_placement_message
    p "Great! You've placed your patrol boat successfully! Now, input three valid coordinates to place your destroyer!"
    convert_input_for_validation_three_boat

  end

  def convert_input_for_validation_three_boat
    user_input = gets.chomp
    @input = user_input.split(" ").sort
    destroyer_first
    destroyer_second
    destroyer_third
    until  validate_destroyer_longer_than_three_consecutive_spaces(destroyer_first, destroyer_second, destroyer_third) == true
      convert_input_for_validation_three_boat
    end
  end

  def destroyer_first
    @input[0]
  end

  def destroyer_second
    @input[1]
  end

  def destroyer_third
    @input[2]
  end

  def validate_destroyer_longer_than_three_consecutive_spaces(destroyer_first, destroyer_second, destroyer_third)
    if @gameboard.cant_place_longer_than_three(destroyer_first, destroyer_second,destroyer_third) == false
      invalid_coordinate_message_three_boat
    else
      validate_destroyer_overlay(destroyer_first, destroyer_second, destroyer_third)
    end
  end

  def validate_destroyer_overlay(destroyer_first, destroyer_second, destroyer_third)
    if @gameboard.cant_overlay_three_unit(destroyer_first, destroyer_second, destroyer_third) == false
      invalid_coordinate_message_three_boat
    else
      validate_three_boat_coord_outside_board(destroyer_first, destroyer_second, destroyer_third)
    end
  end


  def validate_three_boat_coord_outside_board(destroyer_first, destroyer_second, destroyer_third)
    if @gameboard.cant_place_outside_board(destroyer_first, destroyer_second, destroyer_third) == false
      invalid_coordinate_message_three_boat
    else
      validate_diagonally_destroyer(destroyer_first, destroyer_second, destroyer_third)
    end
  end

  def validate_diagonally_destroyer(destroyer_first, destroyer_second, destroyer_third)
    if @gameboard.cant_place_diagonally(destroyer_first, destroyer_second,destroyer_third) == false
      invalid_coordinate_message_three_boat
    else
      validate_wrap_horizontally_destroyer(destroyer_first, destroyer_second, destroyer_third)
    end
  end

  def validate_wrap_horizontally_destroyer(destroyer_first, destroyer_second, destroyer_third)
    if @gameboard.cant_wrap_horizontally_three_unit(destroyer_first, destroyer_second, destroyer_third) == false
      invalid_coordinate_message_three_boat
    else
      validate_wrap_vertically_destroyer(destroyer_first, destroyer_second, destroyer_third)
    end
  end

  def validate_wrap_vertically_destroyer(destroyer_first, destroyer_second, destroyer_third)
    if @gameboard.cant_wrap_vertically_three_unit(destroyer_first, destroyer_second, destroyer_third) == false
      invalid_coordinate_message_three_boat
    else
      validate_destroyer(destroyer_first, destroyer_second, destroyer_third)
    end
  end

  def validate_destroyer(destroyer_first, destroyer_second, destroyer_third)
    if @gameboard.place_three_unit(destroyer_first, destroyer_second, destroyer_third) == false
      invalid_coordinate_message_three_boat
    else
      print "You've successfully placed your ships! Now the computer will shoot first!"
    end
  end


  def update_game_board_to_reflect_placement
    @player.board.board[patrol_first] = "two"
    @player.board.board[patrol_second] = "two"
    @player.board.board[destroyer_first] = "three"
    @player.board.board[destroyer_second] = "three"
    @player.board.board[destroyer_third] = "three"
  end

  def invalid_coordinate_message_three_boat
    p "Invalid coordinates! Please try again!"
    convert_input_for_validation_three_boat
  end



  def computer_placement_message
    p "I have laid out my ships on the grid.You now need to layout your two ships.The first is two units long and the second is three units long.The grid has A1 at the top left and D4 at the bottom right. Enter the squares for the two-unit ship:"
  end
end


battleship = BattleShip.new

battleship.start_game
