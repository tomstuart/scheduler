require 'spec_helper'

require 'scheduler'

describe Scheduler do
  describe 'accessors' do
    let(:start_time) { double('start time') }
    let(:end_time) { double('end time') }
    subject { Scheduler.new(start_time, end_time) }

    its(:start_time) { should == start_time }
    its(:end_time) { should == end_time }
  end

  describe '#pick_times' do
    context 'when picking two times' do
      let(:start_time) { double('start time') }
      let(:end_time) { double('end time') }
      let(:calendar) { double('calendar', periods: periods) }
      let(:periods) { double('periods', split_into: [first_half_periods, second_half_periods]) }
      let(:first_half_periods) { double('first half periods', random_time: first_time) }
      let(:second_half_periods) { double('second half periods', random_time: second_time) }
      let(:first_time) { double('first time') }
      let(:second_time) { double('second time') }
      subject { Scheduler.new(start_time, end_time) }

      before(:each) do
        stub_const('Calendar', double('fake Calendar class', new: calendar))
      end

      it 'should make a new calendar with the right start and end times' do
        Calendar.should_receive(:new).with(start_time, end_time)
        subject.pick_times(2)
      end

      it 'should ask the calendar for its periods' do
        calendar.should_receive(:periods).with(no_args)
        subject.pick_times(2)
      end

      it 'should split the periods into two halves' do
        periods.should_receive(:split_into).with(2)
        subject.pick_times(2)
      end

      it 'should ask each half for a random time' do
        first_half_periods.should_receive(:random_time).with(no_args)
        second_half_periods.should_receive(:random_time).with(no_args)
        subject.pick_times(2)
      end

      it 'should return the two times from the two halves' do
        subject.pick_times(2).should == [first_time, second_time]
      end
    end
  end
end
