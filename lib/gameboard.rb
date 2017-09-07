

class GameBoard

  attr_accessor :board

  def initialize
    @board = {
      "A1" => "", "A2" => "", "A3" => "", "A4" => "",
      "B1" => "", "B2" => "", "B3" => "", "B4" => "",
      "C1" => "", "C2" => "", "C3" => "", "C4" => "",
      "D1" => "", "D2" => "", "D3" => "", "D4" => "" }
  end

  def print_horizontal_headers
    p " | 1 | 2 | 3 | 4 |"
    p "A| #{@board["A1"]}  | #{@board["A2"]}  | #{@board["A3"]}  | #{@board["A4"]}  |"
    p "B| #{@board["B1"]}  | #{@board["B2"]}  | #{@board["B3"]}  | #{@board["B4"]}  |"
    p "C| #{@board["C1"]}  | #{@board["C2"]}  | #{@board["C3"]}  | #{@board["C4"]}  |"
    p "D| #{@board["D1"]}  | #{@board["D2"]}  | #{@board["D3"]}  | #{@board["D4"]}  |"
  end


  def check_nil(patrol_first, patrol_second)
    if board[patrol_second] == nil || board[patrol_first] == nil
      return false
    end
  end

  def cant_place_diagonally_two(patrol_first, patrol_second)
    a = patrol_first.split(//)[1].to_i
    b = patrol_second.split(//)[1].to_i

    x = patrol_first.split(//)[0].ord
    y = patrol_second.split(//)[0].ord
    if a == b || x == y
      return true
    else
      false
    end
  end

  def cant_overlay_two_unit(patrol_first, patrol_second)
    if patrol_first == patrol_second || patrol_second == patrol_first
      return false
    end
  end

  def cant_wrap_vertically_two_unit(destroyer_first, destroyer_second)
    a = destroyer_first.split(//)[0].ord
    b = destroyer_second.split(//)[0].ord
    if a - b == 3
      return false
    end
  end

  def cant_wrap_horizontally_two_unit(destroyer_first, destroyer_second)
    a = destroyer_first.split(//)[1].to_i
    b = destroyer_second.split(//)[1].to_i
    if a - b == 3
       return false
    end
  end

  def cant_place_diagonally_two(patrol_first, patrol_second)
    a = patrol_first.split(//)[1].to_i
    b = patrol_second.split(//)[1].to_i

    x = patrol_first.split(//)[0].ord
    y = patrol_second.split(//)[0].ord
    if a == b || x == y
      return true
    else
      false
    end
  end

  def place_two_unit(patrol_first, patrol_second)
    a = patrol_first.split(//)[1].to_i
    b = patrol_second.split(//)[1].to_i

    x = patrol_first.split(//)[0].ord
    y = patrol_second.split(//)[0].ord


    if b - a > 1 || a - b > 1 || x - y > 1 || y - x > 1
      return false
    else
      board[patrol_first] = "full"
      board[patrol_second] = "full"
      true
    end
  end

def place_three_unit(destroyer_first, destroyer_second, destroyer_third)
    board[destroyer_first] = "full"
    board[destroyer_second] = "full"
    board[destroyer_third] = "full"
    true
  end

  def cant_place_outside_board(destroyer_first, destroyer_second, destroyer_third)
    if board[destroyer_third] == nil || board[destroyer_first] == nil
      return false
    end
  end

  def cant_place_diagonally(destroyer_first, destroyer_second, destroyer_third)
    a = destroyer_first.split(//)[1].to_i
    b = destroyer_second.split(//)[1].to_i
    c = destroyer_third.split(//)[1].to_i

    x = destroyer_first.split(//)[0].ord
    y = destroyer_second.split(//)[0].ord
    z = destroyer_third.split(//)[0].ord

    if a == b && b == c || x == y && y == z
      return true
    else
      false
    end
  end



  def cant_place_longer_than_three(destroyer_first, destroyer_second, destroyer_third)
    a = destroyer_first.split(//)[1].to_i
    b = destroyer_third.split(//)[1].to_i
    if a - b == 3 || b - a == 3
      false
    else
      true
    end
  end

  def cant_overlay_three_unit(destroyer_first, destroyer_second, destroyer_third)
    if destroyer_first == destroyer_second || destroyer_first == destroyer_third
      return false
    end
  end

  def cant_wrap_horizontally_three_unit(destroyer_first, destroyer_second, destroyer_third)
    a = destroyer_first.split(//)[1].to_i
    b = destroyer_third.split(//)[1].to_i
    if a - b > 2 || b - a > 2
       return false
    end
  end

  def cant_wrap_vertically_three_unit(destroyer_first, destroyer_second, destroyer_third)
    a = destroyer_first.split(//)[0].ord
    b = destroyer_third.split(//)[0].ord
    if a - b > 2 || b - a > 2
      return false
    end
  end




end
gameboard = GameBoard.new
