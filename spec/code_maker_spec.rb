require 'spec_helper'
require_relative '../code_maker_game'

RSpec.describe CodeMakerGame do
  describe '#initialize' do
    it 'initializes as a Game subclass' do
      code_maker = CodeMakerGame.new
      expect(code_maker).to be_a(Game)
      expect(code_maker).to be_a(CodeMakerGame)
    end
  end
end
