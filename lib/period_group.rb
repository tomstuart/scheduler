class PeriodGroup
  def initialize(periods)
  end

  def split_into(n)
    [PeriodGroup.new([]), PeriodGroup.new([])]
  end
end
