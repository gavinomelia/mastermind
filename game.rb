require_relative 'board'
require_relative 'code_maker'

class Game
  attr_accessor :board, :code

  def initialize(code = [])
    @code = code
    @board = Board.new(code)
    @code_maker = CodeMaker.new(self, @board)
  end

  def run
    ask_role
  end

  def codebreaker
    introduction
    game_loop
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
      puts 'Invalid guess. Please enter four valid colors separated by spaces.'
    end
  end

  def ask_role
    puts 'Are you the code maker or the code breaker?'
    input = gets.chomp
    if input.downcase == 'code maker'
      codemaker
    else
      codebreaker
    end
  end

  def codemaker
    @code_maker.run
  end

  def introduction
    puts 'Game Started'
    puts 'Try to guess the code sequence of four colors. The color options are red, blue, green, yellow, purple, and orange.'
    puts 'You have 12 turns to guess the code. Otherwise, you lose.'
  end

  def game_loop
    loop do
      turn
      if @board.won?
        puts 'You won!'
        break
      elsif @board.lost?
        loser
        break
      end
    end
  end

  def prompt_guess
    puts 'Code breaker, make a guess'
    gets.chomp
  end

  def loser
    puts 'You lost!'
    puts 'The hidden code was:'
    show_hidden_code
  end

  def parse_guess(input)
    guess = input.split(' ').map { |color| Pin.new(color) }
    return nil unless guess.length == 4

    valid_colors = %w[red blue green yellow purple orange]
    return nil unless guess.all? { |pin| valid_colors.include?(pin.color) }

    guess
  end
end
