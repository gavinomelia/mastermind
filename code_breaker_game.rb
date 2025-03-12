require_relative 'game'
require_relative 'pin'

class CodeBreakerGame < Game
  protected

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

  private

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

  def prompt_guess
    puts 'Code breaker, make a guess'
    gets.chomp
  end

  def loser
    puts 'You lost!'
    puts 'The hidden code was:'
    show_hidden_code
  end

  def show_hidden_code
    puts @board.hidden_code.map(&:color).join(' ')
  end
end
