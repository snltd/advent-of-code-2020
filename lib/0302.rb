# frozen_string_literal: true

require_relative 'support/base'
require_relative 'support/toboggan'

# Problem 0302. We've already done all the work for this.
#
class Advent0302 < Base
  def solve
    [[1, 1],
     [3, 1],
     [5, 1],
     [7, 1],
     [1, 2]].map { |move| Toboggan.new(input).run(move) }.reduce(:*)
  end

  def input_style
    :as_raw_char_grid
  end
end
