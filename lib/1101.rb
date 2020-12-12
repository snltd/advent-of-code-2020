# frozen_string_literal: true

require_relative 'support/base'
require_relative 'support/seat_map'

# Problem 1101
# We don't need a thousand iterations, but you wouldn't want the loop running
# for ever if the input was bad.
#
class Advent1101 < Base
  def solve
    tolerence = 4
    last_map = SeatMap.new(input, tolerence).iterate

    1000.times do
      new_map = SeatMap.new(last_map, tolerence).iterate
      return new_map.flatten.count('#') if new_map == last_map

      last_map = new_map
    end
  end

  def input_style
    :as_raw_char_grid
  end
end
