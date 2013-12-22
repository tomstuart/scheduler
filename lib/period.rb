class Period < Struct.new(:start_time, :end_time)
  def random_time
    duration = end_time - start_time
    start_time + rand(duration)
  end
end
