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
    let(:start_time) { double('start time') }
    let(:end_time) { double('end time') }
    let(:calendar) { double('calendar', periods: periods) }
    subject { Scheduler.new(start_time, end_time) }

    before(:each) do
      stub_const('Calendar', double('fake Calendar class', new: calendar))
    end

    context 'when picking two times' do
      let(:periods) { double('periods', split_into: [first_half_periods, second_half_periods]) }
      let(:first_half_periods) { double('first half periods', random_time: first_time) }
      let(:second_half_periods) { double('second half periods', random_time: second_time) }
      let(:first_time) { double('first time') }
      let(:second_time) { double('second time') }

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

    context 'when picking five times' do
      let(:periods) { double('periods', split_into: [first_fifth_periods, second_fifth_periods, third_fifth_periods, fourth_fifth_periods, fifth_fifth_periods]) }
      let(:first_fifth_periods) { double('first fifth periods', random_time: first_time) }
      let(:second_fifth_periods) { double('second fifth periods', random_time: second_time) }
      let(:third_fifth_periods) { double('third fifth periods', random_time: third_time) }
      let(:fourth_fifth_periods) { double('fourth fifth periods', random_time: fourth_time) }
      let(:fifth_fifth_periods) { double('fifth fifth periods', random_time: fifth_time) }
      let(:first_time) { double('first time') }
      let(:second_time) { double('second time') }
      let(:third_time) { double('third time') }
      let(:fourth_time) { double('fourth time') }
      let(:fifth_time) { double('fifth time') }

      it 'should make a new calendar with the right start and end times' do
        Calendar.should_receive(:new).with(start_time, end_time)
        subject.pick_times(5)
      end

      it 'should ask the calendar for its periods' do
        calendar.should_receive(:periods).with(no_args)
        subject.pick_times(5)
      end

      it 'should split the periods into five fifths' do
        periods.should_receive(:split_into).with(5)
        subject.pick_times(5)
      end

      it 'should ask each fifth for a random time' do
        first_fifth_periods.should_receive(:random_time).with(no_args)
        second_fifth_periods.should_receive(:random_time).with(no_args)
        third_fifth_periods.should_receive(:random_time).with(no_args)
        fourth_fifth_periods.should_receive(:random_time).with(no_args)
        fifth_fifth_periods.should_receive(:random_time).with(no_args)
        subject.pick_times(5)
      end

      it 'should return the five times from the five fifths' do
        subject.pick_times(5).should == [first_time, second_time, third_time, fourth_time, fifth_time]
      end
    end
  end
end
