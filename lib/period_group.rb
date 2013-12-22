class PeriodGroup < Struct.new(:periods)
  def split_into(n)
    (0...n).map do |i|
      start_offset = (i * (periods.length.to_f / n)).round
      end_offset = ((i + 1) * (periods.length.to_f / n)).round
      PeriodGroup.new(periods.slice(start_offset...end_offset))
    end
  end

  def include?(period)
    periods.include?(period)
  end

  def random_time
    periods.sample.random_time
  end
end
