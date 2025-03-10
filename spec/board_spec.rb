require 'spec_helper'
require_relative '../board'
require_relative '../pin'

RSpec.describe 'board' do
  pin_1 = Pin.new('red')
  pin_2 = Pin.new('blue')
  pin_3 = Pin.new('green')
  pin_4 = Pin.new('yellow')
  grade_green = Pin.new('green')
  grade_white = Pin.new('white')
  board = Board.new([pin_1, pin_2, pin_3, pin_4])
  guess = [pin_2, pin_4, pin_3, pin_1]
  grade = [grade_green, grade_white]

  describe '#show_hidden_code' do
    it 'shows the hidden code' do
      expect(board.show_hidden_code).to eq([pin_1, pin_2, pin_3, pin_4])
    end
  end

  describe '#add_grade' do
    it 'adds a grade to the board' do
      board.add_grade(grade)
      expect(board.grades).to include(grade)
    end
  end

  describe '#grade' do
    before do
      allow(board).to receive(:hidden_code).and_return([pin_1, pin_2, pin_3, pin_4])
      @guess = [pin_1, pin_1, pin_1, pin_2]
    end

    it 'grades the guess' do
      graded = board.grade(@guess)
      expect(graded.map(&:color)).to include('red', 'black', 'black', 'black')
    end
  end

  describe '#display' do
    it 'displays the board' do
      board.add_guess(guess)
      board.add_grade(grade)
      expect do
        board.display
      end.to output.to_stdout
    end
  end
end
