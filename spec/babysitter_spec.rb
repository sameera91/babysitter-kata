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

    describe '#valid_time_format' do
      it 'makes sure that the time is in a valid format' do
        babysitter = Babysitter.new
        expect(babysitter.valid_time_format("8:00")).to eq(true)
        expect(babysitter.valid_time_format("44")).to eq(false)
        expect(babysitter.valid_time_format("56:00")).to eq(false)
      end
    end

    describe '#valid_full_hour' do
      it 'makes sure that the time is a full hour and is between 1 and 12' do
        babysitter = Babysitter.new
        expect(babysitter.valid_full_hour("6:40")).to eq(false)
        expect(babysitter.valid_full_hour("14:00")).to eq(false)
        expect(babysitter.valid_full_hour("7:00")).to eq(true)
      end
    end

    describe '#valid_start_time' do
      it 'makes sure that the start time is no earlier than 5:00PM' do
        babysitter = Babysitter.new
        expect(babysitter.valid_start_time("3:00")).to eq(false)
        expect(babysitter.valid_start_time("5:00")).to eq(true)
      end
    end

    describe '#valid_bed_time' do
      it 'makes sure that the bed time is between 6pm and 11pm' do
        babysitter = Babysitter.new
        expect(babysitter.valid_bed_time("7:00")).to eq(true)
        expect(babysitter.valid_bed_time("3:00")).to eq(false)
      end
    end

    describe '#valid_end_time' do
      it 'makes sure that the end time is no later than 4:00AM' do
        babysitter = Babysitter.new
        expect(babysitter.valid_end_time("6:00")).to eq(false)
        expect(babysitter.valid_end_time("3:00")).to eq(true)
      end
    end

    describe '#enter_hours' do 
      it 'allows the user to enter the hours and displays the total wage' do
        babysitter = Babysitter.new
        allow($stdout).to receive(:puts)

        expect(babysitter).to receive(:gets).and_return("6:00")
        expect(babysitter).to receive(:gets).and_return("10:00")
        expect(babysitter).to receive(:gets).and_return("3:00")

        expect($stdout).to receive(:puts).with("Your total wage is $112")

        babysitter.enter_hours
      end
    end
  end
end