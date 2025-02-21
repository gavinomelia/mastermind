require 'spec_helper'
require_relative '../code_maker'

RSpec.describe 'CodeMaker' do
  code_maker = CodeMaker.new
  describe '#set_code' do
    it 'can set the hidden code for the game' do
      code = code_maker.set_code
      expect(code).to be_a(Array)
      expect(code.length).to eq(4)
      code.each do |pin|
        expect(pin).to be_a(Pin)
      end
    end

    it 'be manually set' do
      pin_1 = Pin.new('red')
      pin_2 = Pin.new('blue')
      pin_3 = Pin.new('green')
      pin_4 = Pin.new('yellow')
      code = [pin_1, pin_2, pin_3, pin_4]
      expect(code_maker.set_code(code)).to eq(code)
    end
  end
end
