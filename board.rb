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
end
