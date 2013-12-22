class Period
  attr_accessor :start_time, :end_time

  def initialize(start_time, end_time)
    self.start_time = start_time
    self.end_time = end_time
  end
end
