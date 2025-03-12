require_relative 'game'
require_relative 'pin'

class CodeMakerGame < Game
  protected

  def introduction
    puts 'Entering Code Maker Mode'
    puts 'You will set the hidden code for the game and the computer will try to guess your code.'
    prompt_for_code
  end

  def game_loop
    loop do
      guess = 4.times.map { Pin.new }
      @board.add_guess(guess)
      puts "My guess is #{guess.map(&:color).join(' ')}"
      grade = @board.grade(guess)
      @board.add_grade(grade)
      @board.display
      sleep 2
      break if game_over?
    end
  end

  private

  def game_over?
    if @board.won?
      puts 'I guessed the code!'
      puts 'You lose!'
      return true
    elsif @board.lost?
      puts 'I could not guess the code!'
      puts 'You win!'
      return true
    end
    false
  end

  def prompt_for_code
    puts 'Please enter your code (4 colors separated by spaces):'
    input = gets.chomp
    code = parse_guess(input)
    @board.set_code(code)
    puts "The hidden code is set to #{code.map(&:color).join(' ')}"
  end
end
