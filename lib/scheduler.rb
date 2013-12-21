require 'calendar'

class Scheduler
  attr_accessor :start_time, :end_time

  def initialize(start_time, end_time)
    self.start_time = start_time
    self.end_time = end_time
  end

  def two_times
    calendar = Calendar.new(start_time, end_time)
    all_periods = calendar.periods

    first_half_periods, second_half_periods = all_periods.split_into(2)
    first_time = first_half_periods.random_time
    second_time = second_half_periods.random_time

    [first_time, second_time]
  end
end
