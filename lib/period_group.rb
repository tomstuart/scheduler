class PeriodGroup
  attr_accessor :periods

  def initialize(periods)
    self.periods = periods
  end

  def split_into(n)
    [PeriodGroup.new([]), PeriodGroup.new([])]
  end

  def include?(period)
    periods.include?(period)
  end
end
