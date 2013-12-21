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

  describe '#periods' do
    let(:start_time) { DateTime.new(2013, 12, 2, 0, 0) }
    let(:end_time) { DateTime.new(2013, 12, 8, 23, 59, 59) }

    let(:monday_period)     { double('Monday period') }
    let(:tuesday_period)    { double('Tuesday period') }
    let(:wednesday_period)  { double('Wednesday period') }
    let(:thursday_period)   { double('Thursday period') }
    let(:friday_period)     { double('Friday period') }

    let(:periods) { double('periods') }

    subject(:calendar) { Calendar.new(start_time, end_time) }

    before(:each) do
      stub_const('Period', 'fake Period class')
      Period.stub(:new).with(DateTime.new(2013, 12, 2, 9, 0), DateTime.new(2013, 12, 2, 17, 0)).and_return(monday_period)
      Period.stub(:new).with(DateTime.new(2013, 12, 3, 9, 0), DateTime.new(2013, 12, 3, 17, 0)).and_return(tuesday_period)
      Period.stub(:new).with(DateTime.new(2013, 12, 4, 9, 0), DateTime.new(2013, 12, 4, 17, 0)).and_return(wednesday_period)
      Period.stub(:new).with(DateTime.new(2013, 12, 5, 9, 0), DateTime.new(2013, 12, 5, 17, 0)).and_return(thursday_period)
      Period.stub(:new).with(DateTime.new(2013, 12, 6, 9, 0), DateTime.new(2013, 12, 6, 17, 0)).and_return(friday_period)

      stub_const('PeriodGroup', double('fake PeriodGroup class', new: periods))
    end

    it 'should create the Monday period' do
      Period.should_receive(:new).with(DateTime.new(2013, 12, 2, 9, 0), DateTime.new(2013, 12, 2, 17, 0))
      calendar.periods
    end

    it 'should create the Tuesday period' do
      Period.should_receive(:new).with(DateTime.new(2013, 12, 3, 9, 0), DateTime.new(2013, 12, 3, 17, 0))
      calendar.periods
    end

    it 'should create the Wednesday period' do
      Period.should_receive(:new).with(DateTime.new(2013, 12, 4, 9, 0), DateTime.new(2013, 12, 4, 17, 0))
      calendar.periods
    end

    it 'should create the Thursday period' do
      Period.should_receive(:new).with(DateTime.new(2013, 12, 5, 9, 0), DateTime.new(2013, 12, 5, 17, 0))
      calendar.periods
    end

    it 'should create the Friday period' do
      Period.should_receive(:new).with(DateTime.new(2013, 12, 6, 9, 0), DateTime.new(2013, 12, 6, 17, 0))
      calendar.periods
    end

    it 'should create a group of periods' do
      PeriodGroup.should_receive(:new).with([monday_period, tuesday_period, wednesday_period, thursday_period, friday_period])
      calendar.periods
    end

    it 'should return the group of periods' do
      calendar.periods.should == periods
    end
  end
end
