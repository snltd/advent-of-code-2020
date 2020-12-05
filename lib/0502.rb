# frozen_string_literal: true

require_relative '0501'

# Problem 0502
#
class Advent0502 < Advent0501
  def solve
    seat_list = input.map { |pass| seat_id(pass) }
    (Range.new(seat_list.min, seat_list.max).to_a - seat_list).first
  end
end
