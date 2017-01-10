require_relative '../lib/babysitter.rb'
require 'pry'

describe Babysitter do
  describe 'lib/babysitter.rb' do
    describe '#start_to_bedtime' do
      it 'returns the total wage from start to bedtime' do
        babysitter = Babysitter.new
        expect(babysitter.start_to_bedtime("6:00", "10:00")).to eq(48)
      end
    end

    describe '#bedtime_to_midnight' do
      it 'returns the total wage from bedtime to midnight' do
        babysitter = Babysitter.new
        expect(babysitter.bedtime_to_midnight("10:00")).to eq(16)
      end
    end
  end
end