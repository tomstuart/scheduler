require 'scheduler'
require 'date'

start_time = Time.local(2013, 12, 2, 0, 0)
end_time = Time.local(2013, 12, 8, 23, 59, 59)
scheduler = Scheduler.new(start_time, end_time)
times = scheduler.pick_times(5)

raise 'not times' unless times.all? { |time| time.is_a?(Time) }
raise 'wrong times' unless times.all? { |time| time.between?(start_time, end_time) }
raise 'same times' unless times.uniq.length == times.length

puts "Times are #{times.join(', ')}"
