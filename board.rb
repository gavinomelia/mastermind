class Board
  attr_reader :hidden_code
  attr_accessor :guesses, :grades

  def initialize(hidden_code)
    @hidden_code = hidden_code
    @guesses = []
    @grades = []
  end

  def show_hidden_code
    hidden_code
  end

  def add_guess(guess)
    guesses << guess
  end

  def add_grade(grade)
    grades << grade
  end

  def grade(guess)
    grade = []
    guess.each_with_index do |pin, index|
      if pin.color == hidden_code[index].color
        grade << Pin.new('green')
      elsif hidden_code.any? { |hidden_pin| hidden_pin.color == pin.color }
        grade << Pin.new('white')
      end
    end
    grade
  end

  def display
    puts 'Hidden Code:'
    hidden_code.each { |pin| print "#{pin.color} " }
    puts "\n-------------------"
    guesses.each_with_index do |guess, index|
      puts "Guess #{index + 1}:"
      guess.each { |pin| print "#{pin.color} " }
      puts "\nGrade:"
      grades[index].each { |pin| print "#{pin.color} " }
      puts "\n-------------------"
    end
  end
end
