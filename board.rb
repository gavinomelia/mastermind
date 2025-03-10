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
    @guesses << guess
  end

  def add_grade(grade)
    @grades << grade
  end

  def grade(guess)
    grade = []
    guess.each_with_index do |pin, index|
      if pin.color == hidden_code[index].color
        grade << Pin.new('red')
      elsif hidden_code.any? { |hidden_pin| hidden_pin.color == pin.color }
        grade << Pin.new('black')
      end
    end
    grade
  end

  def won?
    return false if grades.empty?

    @grades.last.all? { |pin| pin.color == 'red' }
  end

  def lost?
    guesses.length == 12 && !won?
  end

  def display
    display_hidden_code
    display_guesses_and_grades
  end

  private

  def display_hidden_code
    puts 'Hidden Code:'
    hidden_code.each { |pin| print "#{pin.color} " }
    puts "\n-------------------"
  end

  def display_guesses_and_grades
    puts "Grades: #{@grades}"
    puts @guesses
    @guesses.each_with_index do |guess, index|
      puts "Guess #{index + 1}:"
      guess.each { |pin| print "#{pin.color} " }
      puts "\nGrade:"
      @grades[index].each { |pin| print "#{pin.color} " }
      puts "\n-------------------"
    end
  end
end
