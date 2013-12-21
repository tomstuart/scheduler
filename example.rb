require 'scheduler'

start_time = DateTime.new(2013, 12, 2, 0, 0)
end_time = DateTime.new(2013, 12, 8, 23, 59, 59)
scheduler = Scheduler.new(start_time, end_time)
first_time, second_time = scheduler.two_times

puts "First time is #{first_time}, second time is #{second_time}"
