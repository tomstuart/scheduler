require 'calendar'

class Scheduler
  attr_accessor :start_time, :end_time

  def initialize(start_time, end_time)
    self.start_time = start_time
    self.end_time = end_time
  end

  def pick_times(n)
    Calendar.new(start_time, end_time).periods.split_into(n).map(&:random_time)
  end
end
