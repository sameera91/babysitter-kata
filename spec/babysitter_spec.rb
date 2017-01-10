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

    describe '#bedtime_to_end' do
      it 'returns the total wage from midnight to end of job' do
        babysitter = Babysitter.new
        expect(babysitter.midnight_to_end("3:00")).to eq(48)
      end
    end

    describe '#add_total' do 
      it 'returns the total wage from start to end' do 
        babysitter = Babysitter.new
        wage1 = babysitter.start_to_bedtime("6:00", "10:00")
        wage2 = babysitter.bedtime_to_midnight("10:00")
        wage3 = babysitter.midnight_to_end("3:00")
        total_wage = wage1 + wage2 + wage3
        expect(babysitter.add_total()).to eq(total_wage)
      end
    end
  end
end