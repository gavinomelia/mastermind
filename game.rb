require_relative 'board'
require_relative 'code_maker'

class Game
  attr_accessor :board, :code

  def initialize(code = [])
    @code = code
    @code_maker = CodeMaker.new
    @board = initialize_board
  end

  def run
    puts 'Game Started'
  end

  def turn
    puts 'Code breaker, make a guess'
    guess = gets.chomp
    @board.add_guess(guess)
  end

  private

  def initialize_board
    board = Board.new(@code_maker.set_code) if code.empty?

    board = Board.new(@code_maker.set_code(code))
  end
end
