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
    loop do
      turn
      if @board.won?
        puts 'You won!'
        break
      elsif @board.lost?
        puts 'You lost!'
        break
      end
    end
    puts 'Game Over'
  end

  def turn
    puts 'Code breaker, make a guess'
    input = gets.chomp
    guess = input.split(' ').map { |color| Pin.new(color) }
    @board.add_guess(guess)
    grade = @board.grade(guess)
    @board.add_grade(grade)
    @board.display
  end

  private

  def initialize_board
    if @code.empty?
      Board.new(@code_maker.set_code)
    else
      Board.new(@code)
    end
  end
end
