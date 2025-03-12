require_relative 'pin'

class Board
  attr_reader :hidden_code
  attr_accessor :guesses, :grades

  def initialize(hidden_code = [])
    @hidden_code = set_code(hidden_code)
    @guesses = []
    @grades = []
  end

  def show_hidden_code
    hidden_code
  end

  def add_guess(guess)
    @guesses << guess
  end

  def add_grade(grade)
    @grades << grade
  end

  def grade(guess)
    grade = []
    @hidden_code.each_with_index do |pin, index|
      if pin.color == guess[index].color
        grade << Pin.new('red')
      elsif guess.any? { |guess_pin| guess_pin.color == pin.color }
        grade << Pin.new('white')
      end
    end
    grade
  end

  def set_code(code = [])
    return code if code.length == 4

    4.times do
      code << Pin.new
    end
    code
  end

  def won?
    return false if grades.empty?

    @grades.last.all? { |pin| pin.color == 'red' } && @grades.last.length == 4
  end

  def lost?
    guesses.length == 12 && !won?
  end

  def display
    display_guesses_and_grades
  end

  private

  def display_hidden_code
    puts 'Hidden Code:'
    hidden_code.each { |pin| print "#{pin.color} " }
    puts "\n-------------------"
  end

  def display_guesses_and_grades
    @guesses.each_with_index do |guess, index|
      puts "Guess #{index + 1}:"
      guess.each { |pin| print "#{pin.color} " }
      puts "\nGrade:"
      @grades.last.each { |pin| print "#{pin.color} " }
      puts "\n-------------------"
    end
  end
end
