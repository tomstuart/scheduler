class PeriodGroup < Struct.new(:periods)
  def split_into(number_of_pieces)
    (0..number_of_pieces).
      map { |piece_number| (piece_number * (periods.length.to_f / number_of_pieces)).round }.
      each_cons(2).
      map { |piece_offset, next_piece_offset| PeriodGroup.new(periods.slice(piece_offset...next_piece_offset)) }
  end

  def include?(period)
    periods.include?(period)
  end

  def random_time
    periods.sample.random_time
  end
end
