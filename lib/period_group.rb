class PeriodGroup < Struct.new(:periods)
  def split_into(number_of_pieces)
    ideal_piece_size = periods.length.to_f / number_of_pieces

    (0..number_of_pieces).
      map { |piece_number| (piece_number * ideal_piece_size).round }.
      each_cons(2).
      map { |piece_offset, next_piece_offset| piece_offset...next_piece_offset }.
      map { |piece_range| PeriodGroup.new(periods.slice(piece_range)) }
  end

  def include?(period)
    periods.include?(period)
  end

  def random_time
    periods.sample.random_time
  end
end
