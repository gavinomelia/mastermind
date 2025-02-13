require 'spec_helper'
require_relative '../pin'

RSpec.describe 'Pin' do
  pin = Pin.new('red')
  describe '#color' do
    it 'can return its color' do
      expect(pin.color).to eq('red')
    end
  end
end
