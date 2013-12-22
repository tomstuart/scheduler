class PeriodGroup < Struct.new(:periods)
  def split_into(n)
    (0..n).
      map { |i| (i * (periods.length.to_f / n)).round }.
      each_cons(2).
      map { |first, last| PeriodGroup.new(periods.slice(first...last)) }
  end

  def include?(period)
    periods.include?(period)
  end

  def random_time
    periods.sample.random_time
  end
end
