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



end

  def computer_placement_message
    p "I have laid out my ships on the grid.You now need to layout your two ships.The first is two units long and the second is three units long.The grid has A1 at the top left and D4 at the bottom right. Enter the squares for the two-unit ship:"
  end




battleship = BattleShip.new

battleship.start_game
