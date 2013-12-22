require 'calendar'

class Scheduler < Struct.new(:start_time, :end_time)
  def pick_times(n)
    Calendar.new(start_time, end_time).periods.split_into(n).map(&:random_time)
  end
end
