require 'spec_helper'
require_relative '../game'

RSpec.describe 'Game' do
  game = Game.new
  describe '#run' do
    it 'starts the game' do
      expect(game.run).to eq('Game is running')
    end
  end

  describe '#turn' do
    it 'prompts the code breaker to make a guess' do
      expect(game.turn).to eq('Code breaker, make a guess')
      expect(game.turn).to recieve(:gets).and_return('1234')
    end
  end
end
