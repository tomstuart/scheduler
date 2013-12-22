require 'scheduler'
require 'date'

start_time = Time.local(2013, 12, 2, 0, 0)
end_time = Time.local(2013, 12, 8, 23, 59, 59)
scheduler = Scheduler.new(start_time, end_time)
first_time, second_time = scheduler.pick_times(2)

raise 'not times' unless first_time.is_a?(Time) && second_time.is_a?(Time)
raise 'wrong times' unless first_time.between?(start_time, end_time) && second_time.between?(start_time, end_time)
raise 'same times' unless first_time != second_time

puts "First time is #{first_time}, second time is #{second_time}"
