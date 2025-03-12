require 'spec_helper'
require_relative '../code_maker'

RSpec.describe 'CodeMaker' do
  describe '#initialize' do
    it 'initializes with a game and board' do
      game = double('game')
      board = double('board')
      code_maker = CodeMaker.new(game, board)
      expect(code_maker).to be_a(CodeMaker)
    end
  end
end
