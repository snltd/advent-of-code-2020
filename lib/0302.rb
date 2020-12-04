# frozen_string_literal: true

require_relative '0301'

# Problem 0302. We've already done all the work for this.
#
class Advent0302 < Advent0301
  def solve
    [[1, 1],
     [3, 1],
     [5, 1],
     [7, 1],
     [1, 2]].map { |move| toboggan_run(move) }.reduce(:*)
  end
end
