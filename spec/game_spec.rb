require 'spec_helper'
require_relative '../game'

RSpec.describe 'Game' do
  describe "#initialize" do
    code_maker = CodeMaker.new
    pin_1 = Pin.new('red')
    pin_2 = Pin.new('blue')
    pin_3 = Pin.new('green')
    pin_4 = Pin.new('yellow')
    code = [pin_1, pin_2, pin_3, pin_4]
    game = Game.new(code_maker.set_code(code))
    it 'sets up the board' do
      expect(game.board.hidden_code).to eq(code)
    end
  end

  context 'when the game is running' do
    game = Game.new
    describe '#run' do
      xit 'starts the game' do
        expect(game.run).to eq('Game is running')
      end
    end

    describe '#turn' do
      xit 'prompts the code breaker to make a guess' do
        expect(game.turn).to eq('Code breaker, make a guess')
        expect(game.turn).to recieve(:gets).and_return('1234')
      end
    end
  end

end
