require 'spec_helper'

require 'period_group'

describe PeriodGroup do
  describe 'creating a period group' do
    let(:periods) { double('periods') }

    it 'should be possible to create a period group with an array of periods' do
      -> { PeriodGroup.new(periods) }.should_not raise_error
    end
  end

  describe '#split_into' do
    let(:periods) { [double('first period'), double('second period')] }
    subject { PeriodGroup.new(periods) }

    it 'should return two period groups' do
      subject.split_into(2).should have(2).period_groups
    end
  end
end
