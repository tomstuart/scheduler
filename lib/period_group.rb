class PeriodGroup
  attr_accessor :periods

  def initialize(periods)
    self.periods = periods
  end

  def split_into(n)
    i = 0
    results = []

    while i < n
      start_offset = (i * (periods.length / n)).round
      end_offset = ((i + 1) * (periods.length / n)).round
      results << PeriodGroup.new(periods.slice(start_offset..end_offset))
      i += 1
    end

    results
  end

  def include?(period)
    periods.include?(period)
  end
end
