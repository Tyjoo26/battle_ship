require './lib/gameboard'

class Player

  attr_reader :winner, :health, :board

  def initialize
    @winner = false
    @health = 5
    @board = GameBoard.new
  end

  def convert_input_for_validation_two_boat
    user_input = gets.chomp
    user_input = user_input.split(" ")
  end

  def convert_to_space_1
    convert_input_for_validation[0]
  end

  def convert_to_space_2
    conver_input_for_validation[1]
  end

  def validate_two_boat_coord
    if @board.cant_place_diagonally_two(convert_to_space_1, convert_to_space_2) == false
      invalid_coordinate_message
    elsif @board.cant_wrap_horizontally_two_unit(convert_to_space_1, convert_to_space_2)
      invalid_coordinate_message
    elsif @board.cant_wrap_vertically_two_unit(convert_to_space_1, convert_to_space_2)
    elsif @board.check_nil(convert_to_space_1, convert_to_space_2)
  end


end
