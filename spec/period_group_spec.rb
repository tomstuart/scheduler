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
    let(:period_group) { PeriodGroup.new(periods) }

    context 'when there are two periods' do
      let(:first_period) { double('first period') }
      let(:second_period) { double('second period') }
      let(:periods) { [first_period, second_period] }

      context 'when splitting into one' do
        subject { period_group.split_into(1) }

        it { should have(1).period_group }

        specify 'the first period group should contain the first period' do
          subject[0].should include(first_period)
        end

        specify 'the first period group should contain the second period' do
          subject[0].should include(second_period)
        end
      end

      context 'when splitting into two' do
        subject { period_group.split_into(2) }

        it { should have(2).period_groups }

        specify 'the first period group should contain the first period' do
          subject[0].should include(first_period)
        end

        specify 'the second period group should contain the second period' do
          subject[1].should include(second_period)
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
        subject { period_group.split_into(2) }

        it { should have(2).period_groups }

        specify 'the first period group should contain the first period' do
          subject[0].should include(first_period)
        end

        specify 'the first period group should contain the second period' do
          subject[0].should include(second_period)
        end

        specify 'the first period group should contain the third period' do
          subject[0].should include(third_period)
        end

        specify 'the second period group should contain the fourth period' do
          subject[1].should include(fourth_period)
        end

        specify 'the second period group should contain the fifth period' do
          subject[1].should include(fifth_period)
        end
      end

      context 'when splitting into five' do
        subject { period_group.split_into(5) }

        it { should have(5).period_groups }

        specify 'the first period group should contain the first period' do
          subject[0].should include(first_period)
        end

        specify 'the second period group should contain the second period' do
          subject[1].should include(second_period)
        end

        specify 'the third period group should contain the third period' do
          subject[2].should include(third_period)
        end

        specify 'the fourth period group should contain the fourth period' do
          subject[3].should include(fourth_period)
        end

        specify 'the fifth period group should contain the fifth period' do
          subject[4].should include(fifth_period)
        end
      end
    end

    context 'when there are eleven periods' do
      let(:periods) { 11.times.map { |n| double("period #{n}") } }

      context 'when splitting into three' do
        subject { period_group.split_into(3) }

        it { should have(3).period_groups }

        [0, 1, 2, 3].each do |n|
          specify "the first period group should contain period #{n}" do
            subject[0].should include(periods[n])
          end
        end

        [4, 5, 6].each do |n|
          specify "the second period group should contain period #{n}" do
            subject[1].should include(periods[n])
          end
        end

        [7, 8, 9, 10].each do |n|
          specify "the third period group should contain period #{n}" do
            subject[2].should include(periods[n])
          end
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

  describe '#random_time' do
    context 'when the group has one period' do
      let(:period) { double('period') }
      subject { PeriodGroup.new([period]) }

      it 'should return a Time' do
        subject.random_time.should be_a(Time)
      end
    end
  end
end
