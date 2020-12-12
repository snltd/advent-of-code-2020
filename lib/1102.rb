# frozen_string_literal: true

require_relative 'support/base'
require_relative 'support/seat_map_2'

# Problem 1102
# We don't need a thousand iterations, but you wouldn't want the loop running
# for ever if the input was bad.
#
class Advent1102 < Base
  def solve
    tolerence = 5
    last_map = SeatMap2.new(input, tolerence).iterate

    1000.times do
      new_map = SeatMap2.new(last_map, tolerence).iterate
      return new_map.flatten.count('#') if new_map == last_map

      last_map = new_map
    end
  end

  def input_style
    :as_raw_char_grid
  end
end
