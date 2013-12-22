require 'spec_helper'

require 'period'

describe Period do
  describe 'creating a period' do
    let(:start_time) { double('start time') }
    let(:end_time) { double('end time') }

    it 'should be possible to create a period with a start and end time' do
      -> { Period.new(start_time, end_time) }.should_not raise_error
    end
  end

  describe '#start_time' do
    let(:start_time) { double('start time') }
    let(:end_time) { double('end time') }
    subject { Period.new(start_time, end_time) }

    its(:start_time) { should == start_time }
  end

  describe '#end_time' do
    let(:start_time) { double('start time') }
    let(:end_time) { double('end time') }
    subject { Period.new(start_time, end_time) }

    its(:end_time) { should == end_time }
  end

  describe '#random_time' do
    let(:start_time) { Time.local(2013, 12, 2, 9, 0) }
    let(:end_time) { Time.local(2013, 12, 2, 17, 0) }
    subject { Period.new(start_time, end_time) }

    it 'should return a time within the period' do
      subject.random_time.should be_between(start_time, end_time)
    end

    it 'should return a different time every time' do
      subject.random_time.should_not == subject.random_time
    end
  end
end
