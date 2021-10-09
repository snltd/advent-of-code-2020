# frozen_string_literal: true

require_relative 'support/base'
require_relative 'support/binary_partition'

# Problem 0501
#
class Advent0501 < Base
  def solve
    input.map { |pass| seat_id(pass) }.max
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
