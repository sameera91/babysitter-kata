require_relative '../lib/babysitter.rb'
require 'pry'

describe Babysitter do
  describe 'lib/babysitter.rb' do
    describe '#enter_hours' do 
      it 'allows the user to enter times and displays the total wage' do
        babysitter = Babysitter.new
        allow($stdout).to receive(:puts)

        expect(babysitter).to receive(:gets).and_return("6:00")
        expect(babysitter).to receive(:gets).and_return("10:00")
        expect(babysitter).to receive(:gets).and_return("3:00")

        expect($stdout).to receive(:puts).with("Your total wage is $112")

        babysitter.enter_hours
      end

      it 'allows the user to re-enter start time if invalid' do
        babysitter = Babysitter.new
        allow($stdout).to receive(:puts)
        expect(babysitter).to receive(:gets).and_return("4:00")
        expect($stdout).to receive(:puts).with("Must be a time between 5pm and 12am. Try again.")
        expect(babysitter).to receive(:gets).and_return("6:30")
        expect($stdout).to receive(:puts).with("Must be a full hour. Try again.")
        expect(babysitter).to receive(:gets).and_return("6:00")
        expect(babysitter).to receive(:gets).and_return("10:00")
        expect(babysitter).to receive(:gets).and_return("3:00")

        expect($stdout).to receive(:puts).with("Your total wage is $112")
        babysitter.enter_hours
      end
    end
  end
end