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

  describe '#end_time' do
    let(:start_time) { double('start time') }
    let(:end_time) { double('end time') }
    subject { Period.new(start_time, end_time) }

    its(:end_time) { should == end_time }
  end
end
