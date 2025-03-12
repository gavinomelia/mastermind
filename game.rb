require_relative 'board'
require_relative 'pin'

class Game
  attr_accessor :board, :code

  def initialize(code = [])
    @code = code
    @board = Board.new(code)
  end

  def run
    introduction
    game_loop
    puts 'Game Over'
  end

  def parse_guess(input)
    guess = input.split(' ').map { |color| Pin.new(color) }
    return nil unless guess.length == 4

    valid_colors = %w[red blue green yellow purple orange]
    return nil unless guess.all? { |pin| valid_colors.include?(pin.color) }

    guess
  end

  def self.start
    puts 'Are you the code maker or the code breaker?'
    input = gets.chomp
    if input.downcase == 'code maker'
      CodeMakerGame.new.run
    else
      CodeBreakerGame.new.run
    end
  end

  protected

  def introduction
    # To be implemented by subclasses
    raise NotImplementedError
  end

  def game_loop
    # To be implemented by subclasses
    raise NotImplementedError
  end
end
