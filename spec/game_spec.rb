require 'spec_helper'
require_relative '../game'

RSpec.describe 'Game' do
  describe '#initialize' do
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
      it 'starts the game' do
        expect { game.run }.to output("Game Started\n").to_stdout
      end
    end

    describe '#turn' do
      it 'adds the guess to the board' do
        allow(game).to receive(:gets).and_return('1234')
        game.turn
        expect(game.board.guesses.last).to eq('1234')
      end
    end
  end
end
