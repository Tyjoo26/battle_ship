require './lib/computer'
require './lib/player'
require './lib/gameboard'
require 'pry'

class BattleShip

  def initialize
    @player = Player.new
    @comp = Computer.new
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
    p "You will need to place your ships on a grid by typing in coordinates(eg: A1, A2). Your ship cannot be placed outside of the grid, diagonally, or overlapping. You and the computer will alternate turns taking guesses at a game grid to sink the opposings players ship. Do you want to (p)lay or (q)uit?"
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
    @comp.change_grid_to_show_placement
    computer_placement_message
    #display message saying ships are placed by computer
    convert_input_for_validation_two_boat
    validate_two_boat_coord
    validate_three_boat_coord
    #player placement two boat

    #player placement three boat
    #computer shoots first
    #players board changes
    #display updated board
    #display message hit or miss
    #player shoots after
    #computer board changes
    #display message hit or miss
    #after computer or player shoots, program evaluates, update display
    #sequence repeats until win or loss

  end


  def computer_placement_message
    p "I have laid out my ships on the grid.You now need to layout your two ships.The first is two units long and the second is three units long.The grid has A1 at the top left and D4 at the bottom right. Enter the squares for the two-unit ship:"
  end

  def convert_input_for_validation_two_boat
    user_input = gets.chomp
    user_input = user_input.split(" ")
  end

  def convert_to_space_1_two_boat
    convert_input_for_validation[0]
  end

  def convert_to_space_2_two_boat
    conver_input_for_validation[1]
  end

  def validate_two_boat_coord
    if @player.board.cant_place_diagonally_two(convert_to_space_1_two_boat, convert_to_space_2_two_boat) == false || @player.board.cant_wrap_horizontally_two_unit(convert_to_space_1_two_boat, convert_to_space_2_two_boat) == false
      invalid_coordinate_message_two_boat
    elsif @player.board.cant_wrap_vertically_two_unit(convert_to_space_1_two_boat, convert_to_space_2_two_boat) == false || @player.board.check_nil(convert_to_space_1_two_boat, convert_to_space_2_two_boat) == false
      invalid_coordinate_message_two_boat
    else @player.board.place_two_unit(convert_to_space_1_two_boat, convert_to_space_2_two_boat) == true
      convert_input_for_validation_three_boat
    end
  end

  def convert_input_for_validation_three_boat
    user_input = gets.chomp
    user_input = user_input.split(" ")
  end

  def convert_to_space_1_for_three_boat
    get_input_three_unit_boat_and_convert[0]
  end

  def convert_to_space_2_for_three_boat
    get_input_three_unit_boat_and_convert[1]
  end

  def convert_to_space_3_for_three_boat
    get_input_three_unit_boat_and_convert[2]
  end

  def validate_three_boat_coord
    if @board.cant_place_longer_than_three(convert_to_space_1_for_three_boat, convert_to_space_2_for_three_boat,convert_to_space_3_for_three_boat) == false
      invalid_coordinate_message_three_boat
    elsif @board.cant_overlay_three_unit(convert_to_space_1_for_three_boat, convert_to_space_2_for_three_boat,convert_to_space_3_for_three_boat) == false
      invalid_coordinate_message_three_boat
    elsif @board.cant_place_outside_board(convert_to_space_1_for_three_boat, convert_to_space_2_for_three_boat,convert_to_space_3_for_three_boat) == false
      invalid_coordinate_message_three_boat
    elsif @board.cant_place_diagonally(convert_to_space_1_for_three_boat, convert_to_space_2_for_three_boat,convert_to_space_3_for_three_boat) == false
      invalid_coordinate_message_three_boat
    elsif @board.cant_wrap_horizontally_three_unit(convert_to_space_1_for_three_boat, convert_to_space_2_for_three_boat,convert_to_space_3_for_three_boat) == false
      invalid_coordinate_message_three_boat
    elsif @board.cant_wrap_vertically_three_unit(convert_to_space_1_for_three_boat, convert_to_space_2_for_three_boat,convert_to_space_3_for_three_boat) == false
      invalid_coordinate_message_three_boat
    else @board.place_three_unit(convert_to_space_1_for_three_boat, convert_to_space_2_for_three_boat,convert_to_space_3_for_three_boat) == true
      !!!!NEED TO FIGURE OUT WORKFLOW!!!!
    end
  end


end


battleship = BattleShip.new

battleship.start_game
