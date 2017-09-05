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

  def convert_to_space_1_two_boat
    convert_input_for_validation[0]
  end

  def convert_to_space_2_two_boat
    conver_input_for_validation[1]
  end

  # def validate_two_boat_coord
  #   if @board.cant_place_diagonally_two(convert_to_space_1_two_boat, convert_to_space_2_two_boat) == false
  #     invalid_coordinate_message_two_boat
  #   elsif @board.cant_wrap_horizontally_two_unit(convert_to_space_1_two_boat, convert_to_space_2_two_boat) == false
  #     invalid_coordinate_message_two_boat
  #   elsif @board.cant_wrap_vertically_two_unit(convert_to_space_1_two_boat, convert_to_space_2_two_boat) == false
  #     invalid_coordinate_message_two_boat
  #   elsif @board.check_nil(convert_to_space_1_two_boat, convert_to_space_2_two_boat) == false
  #     invalid_coordinate_message
  #   else @board.place_two_unit == true
  #     !!!!get_input_three_unit_boat!!!!#need to figure out workflow
  #   end
  # end
  #
  #
  # def convert_input_for_validation_three_boat
  #   user_input = gets.chomp
  #   user_input = user_input.split(" ")
  # end
  #
  # def convert_to_space_1_for_three_boat
  #   get_input_three_unit_boat_and_convert[0]
  # end
  #
  # def convert_to_space_2_for_three_boat
  #   get_input_three_unit_boat_and_convert[1]
  # end
  #
  # def convert_to_space_3_for_three_boat
  #   get_input_three_unit_boat_and_convert[2]
  # end
  #
  # def validate_three_boat_coord
  #   if @board.cant_place_longer_than_three(convert_to_space_1_for_three_boat, convert_to_space_2_for_three_boat,convert_to_space_3_for_three_boat) == false
  #     invalid_coordinate_message_three_boat
  #   elsif @board.cant_overlay_three_unit(convert_to_space_1_for_three_boat, convert_to_space_2_for_three_boat,convert_to_space_3_for_three_boat) == false
  #     invalid_coordinate_message_three_boat
  #   elsif @board.cant_place_outside_board(convert_to_space_1_for_three_boat, convert_to_space_2_for_three_boat,convert_to_space_3_for_three_boat) == false
  #     invalid_coordinate_message_three_boat
  #   elsif @board.cant_place_diagonally(convert_to_space_1_for_three_boat, convert_to_space_2_for_three_boat,convert_to_space_3_for_three_boat) == false
  #     invalid_coordinate_message_three_boat
  #   elsif @board.cant_wrap_horizontally_three_unit(convert_to_space_1_for_three_boat, convert_to_space_2_for_three_boat,convert_to_space_3_for_three_boat) == false
  #     invalid_coordinate_message_three_boat
  #   elsif @board.cant_wrap_vertically_three_unit(convert_to_space_1_for_three_boat, convert_to_space_2_for_three_boat,convert_to_space_3_for_three_boat) == false
  #     invalid_coordinate_message_three_boat
  #   else @board.place_three_unit(convert_to_space_1_for_three_boat, convert_to_space_2_for_three_boat,convert_to_space_3_for_three_boat) == true
  #     !!!!NEED TO FIGURE OUT WORKFLOW!!!!
  #   end
  # end

  def invalid_coordinate_message_two_boat
    p "Invalid coordinates, try again!"
    convert_input_for_validation_two_boat
  end

  def invalid_coordinate_message_three_boat
    p "Invalid coordinates, try again!"
    convert_input_for_validation_three_boat
  end

  def fire_shot

  end

  def record_player_shot_as_hit_or_miss

  end

  def update_health_if_hit

  end

  def is_winner?

  end

end
