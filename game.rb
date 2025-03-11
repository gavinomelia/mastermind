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
    puts 'Try to guess the code sequence of four colors. The color options are red, blue, green, yellow, purple, and orange.'
    puts 'You have 12 turns to guess the code. Otherwise, you lose.'
    loop do
      turn
      if @board.won?
        puts 'You won!'
        break
      elsif @board.lost?
        puts 'You lost!'
        puts 'The hidden code was:'
        show_hidden_code
        break
      end
    end
    puts 'Game Over'
  end

  def turn
    input = prompt_guess
    guess = parse_guess(input)

    if guess
      @board.add_guess(guess)
      grade = @board.grade(guess).shuffle
      @board.add_grade(grade)
      @board.display
    else
      puts 'Invalid guess. Please enter four colors separated by spaces.'
    end
  end

  private

  def prompt_guess
    puts 'Code breaker, make a guess'
    gets.chomp
  end

  def parse_guess(input)
    guess = input.split(' ').map { |color| Pin.new(color) }
    return nil unless guess.length == 4

    guess.each do |pin|
      unless %w[red blue green yellow purple orange].include?(pin.color)
        puts 'Invalid color. Please choose from red, blue, green, yellow, purple, or orange.'
        prompt_guess
      end
    end
    guess
  end

  def initialize_board
    if @code.empty?
      Board.new(@code_maker.set_code)
    else
      Board.new(@code)
    end
  end
end
