# frozen_string_literal: true

require_relative 'support/base'
require_relative 'support/toboggan'

# Problem 0301. All the work for this is in the Grid class, which took ages
# and I hope I'll get some more use from.
#
class Advent0301 < Base
  def solve
    Toboggan.new(input).run([3, 1])
  end

  def input_style
    :as_raw_char_grid
  end
end
