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
    context 'when splitting into two' do
      let(:first_period) { double('first period') }
      let(:second_period) { double('second period') }
      let(:periods) { [first_period, second_period] }
      subject { PeriodGroup.new(periods) }

      it 'should return two period groups' do
        subject.split_into(2).should have(2).period_groups
      end

      specify 'the first period group should contain the first period' do
        subject.split_into(2)[0].should include(first_period)
      end

      specify 'the second period group should contain the second period' do
        subject.split_into(2)[1].should include(second_period)
      end
    end
  end

  describe '#include?' do
    let(:period) { double('period') }
    let(:another_period) { double('another period') }
    subject { PeriodGroup.new([period]) }

    it { should include(period) }
    it { should_not include(another_period) }
  end
end
