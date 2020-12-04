# frozen_string_literal: true

require_relative 'support/base'

# Problem 0301. All the work for this is in the Grid class, which took ages
# and I hope I'll get some more use from.
#
class Advent0301 < Base
  def solve
    toboggan_run([3, 1])
  end

  private

  def toboggan_run(move)
    g = Grid.new(input, move: move)
    hits = 0

    loop do
      hits += 1 if g.hit?
      g.move!
    end
  rescue OutsideGridY
    hits
  end

  def input_style
    :as_raw_char_grid
  end
end
