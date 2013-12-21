require 'active_support/core_ext'

class Calendar
  START_HOUR = 9
  END_HOUR = 17

  attr_accessor :start_time, :end_time

  def initialize(start_time, end_time)
    self.start_time = start_time
    self.end_time = end_time
  end

  def periods
    periods = []

    period_start_time = start_time.change(hour: START_HOUR)
    period_start_time += 1.day until start_time <= period_start_time

    until period_start_time > end_time
      period_end_time = period_start_time.change(hour: END_HOUR)
      periods << Period.new(period_start_time, period_end_time) unless period_start_time.saturday? || period_start_time.sunday?
      period_start_time += 1.day
    end

    PeriodGroup.new(periods)
  end
end
