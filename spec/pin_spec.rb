require 'spec_helper'
require_relative '../pin'

RSpec.describe 'Pin' do
  describe '#color' do
  it 'can return its color' do
      pin = Pin.new('red') 
      expect(pin.color).to eq('red')
    end
  end

  describe '#initialize' do
    it 'can be initialized with a random color' do
      pin = Pin.new
      expect(pin.send(:colors)).to include(pin.color)
    end
  end
end
