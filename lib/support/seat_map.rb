# frozen_string_literal: true

# For Day 11
class SeatMap
  attr_reader :raw

  FLOOR = '.'
  OCCUPIED = '#'
  EMPTY = 'L'

  def initialize(input, tolerence = 4)
    @tolerence = tolerence
    @raw = input
  end

  def iterate
    raw.map.with_index do |row, y|
      row.map.with_index { |_col, x| apply_rules(x, y) }
    end
  end

  def apply_rules(x, y)
    return FLOOR if floor?(x, y)

    occupied_around = occupied(adjacent_to(x, y))

    if occupied?(x, y)
      occupied_around >= @tolerence ? EMPTY : OCCUPIED
    else
      occupied_around.zero? ? OCCUPIED : EMPTY
    end
  end

  # @return [Array] state of seats around given coordinate, left-to-right,
  # top-to-bottom.
  #
  def adjacent_to(x, y)
    all = adjacent.map { |ax, ay| [x + ax, y + ay] }
    all.select { |nx, ny| on_map?(nx, ny) }
  end

  def adjacent
    [[-1, -1], [0, -1], [1, -1],
     [-1, 0],           [1, 0],
     [-1, 1], [0, 1], [1, 1]]
  end

  # @return [Integer] how many seats in the given list are occupied
  #
  def occupied(seats)
    seats.count { |x, y| occupied?(x, y) }
  end

  def occupied?(x, y)
    @raw[y][x] == OCCUPIED
  end

  def on_map?(x, y)
    x >= 0 && y >= 0 && x < raw.first.size && y < raw.size
  end

  def floor?(x, y)
    @raw[y][x] == FLOOR
  end
end
