# frozen_string_literal: true

require_relative 'support/base'
require_relative 'support/binary_partition'

# Problem 0502
#
class Advent0502 < Base
  def solve
    seat_list = input.map { |pass| seat_id(pass) }
    (Range.new(seat_list.min, seat_list.max).to_a - seat_list).first
  end

  def seat_id(pass)
    row = BinaryPartition.new(pass[0..6], 'B').value
    column = BinaryPartition.new(pass[7..10], 'R').value
    (row * 8) + column
  end

  def input_style
    :as_lines
  end
end
