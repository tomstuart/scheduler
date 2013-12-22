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
    subject { PeriodGroup.new(periods) }

    context 'when there are two periods' do
      let(:first_period) { double('first period') }
      let(:second_period) { double('second period') }
      let(:periods) { [first_period, second_period] }

      context 'when splitting into two' do
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

    context 'when there are five periods' do
      let(:first_period) { double('first period') }
      let(:second_period) { double('second period') }
      let(:third_period) { double('third period') }
      let(:fourth_period) { double('fourth period') }
      let(:fifth_period) { double('fifth period') }
      let(:periods) { [first_period, second_period, third_period, fourth_period, fifth_period] }

      context 'when splitting into two' do
        it 'should return two period groups' do
          subject.split_into(2).should have(2).period_groups
        end

        specify 'the first period group should contain the first period' do
          subject.split_into(2)[0].should include(first_period)
        end

        specify 'the first period group should contain the second period' do
          subject.split_into(2)[0].should include(second_period)
        end

        specify 'the first period group should contain the third period' do
          subject.split_into(2)[0].should include(third_period)
        end

        specify 'the second period group should contain the fourth period' do
          subject.split_into(2)[1].should include(fourth_period)
        end

        specify 'the second period group should contain the fifth period' do
          subject.split_into(2)[1].should include(fifth_period)
        end
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
