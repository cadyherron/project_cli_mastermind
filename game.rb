require_relative 'player.rb'
require_relative 'human.rb'
require_relative 'computer.rb'
require_relative 'board.rb'
require_relative 'logic.rb'

class Game

  def initialize
    @winning_board = []
    @codemaker = nil
    @codebreaker = nil
  end


  def print_instructions
    puts "Welcome to Mastermind! The point of the game is to guess a hidden combination of four pegs. You get 12 guesses. Each peg has a different color and position. The valid colors to guess are: red, orange, yellow, green, blue and purple."
  end


  def determine_codemaker
    until @codemaker
      puts "Would you like to do be codebreaker or codemaker? Enter 'make' or 'break'"
        choice = gets.chomp.downcase
        if ["make", "break"].include? choice
          if choice == "make"
            @codemaker, @codebreaker = Human.new, Computer.new
          else
            @codebreaker, @codemaker = Human.new, Computer.new
          end
        else
          puts "Invalid selection."
        end
    end
  end


  def user_has_won?
    @winning_board == @codebreaker.guess ? true : false
  end


  def play
    print_instructions
    # prompt user for codemaker or codebreaker
    determine_codemaker
    # make winning board
    @winning_board = @codemaker.create_board 
    print @winning_board
    # ask for guesses, constantly display current board with previous guesses
    puts "user has won?", user_has_won?
    puts "turns: ", @codebreaker.turn == 0
    until user_has_won? || (@codebreaker.turn == 0)
      puts "i'm in here!"
      @codebreaker.guess = @codebreaker.create_board
      @codebreaker.turn -= 1


    end
    # check if guess was winning guess


  end


end


g = Game.new
g.play