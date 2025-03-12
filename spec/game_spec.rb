require 'spec_helper'
require_relative '../game'
require_relative '../code_breaker_game'
require_relative '../code_maker_game'

RSpec.describe Game do
  describe '#initialize' do
    let(:pin_1) { Pin.new('red') }
    let(:pin_2) { Pin.new('blue') }
    let(:pin_3) { Pin.new('green') }
    let(:pin_4) { Pin.new('yellow') }
    let(:code) { [pin_1, pin_2, pin_3, pin_4] }
    let(:board) { Board.new }
    let(:game) { Game.new(code) }

    it 'sets up the board' do
      expect(game.board.hidden_code).to eq(code)
    end
  end

  describe '#parse_guess' do
    let(:game) { Game.new }

    it 'parses a valid guess' do
      guess = game.parse_guess('red blue green yellow')
      expect(guess.map(&:color)).to eq(%w[red blue green yellow])
    end

    it 'returns nil for an invalid guess' do
      expect(game.parse_guess('bad color')).to be_nil
    end
  end
end
