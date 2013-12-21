require 'spec_helper'

require 'calendar'

describe Calendar do
  describe 'creating a calendar' do
    let(:start_time) { double('start time') }
    let(:end_time) { double('end time') }

    it 'should be possible to create a calendar with a start and end time' do
      -> { Calendar.new(start_time, end_time) }.should_not raise_error
    end
  end
end
