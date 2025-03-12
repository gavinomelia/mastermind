require 'spec_helper'
require_relative '../code_breaker_game'

RSpec.describe CodeBreakerGame do
  describe '#initialize' do
    it 'initializes as a Game subclass' do
      code_breaker = CodeBreakerGame.new
      expect(code_breaker).to be_a(Game)
      expect(code_breaker).to be_a(CodeBreakerGame)
    end
  end
end
