# frozen_string_literal: true

require_relative 'support/base'

# Problem 1201
#
class Advent1201 < Base
  def solve
    nav = Navigator.new(input)
    nav.parse
    nav.manhattan_distance
  end

  def input_style
    :as_lines
  end
end

# Start at [0, 0] which is in the middle of an imaginary grid. Going north
# increases the y value, going east increases x.
#
class Navigator
  attr_reader :raw, :pos, :bearing

  EAST = [1, 0].freeze
  SOUTH = [0, -1].freeze
  WEST = [-1, 0].freeze
  NORTH = [0, 1].freeze

  def initialize(input = [])
    @raw = input
    @pos = [0, 0]
    @bearing = EAST
  end

  def parse
    raw.each do |instruction|
      direction = instruction[0].downcase
      magnitude = instruction[1..].to_i
      send("go_#{direction}", magnitude)
    end
  end

  def manhattan_distance
    pos.map(&:abs).sum
  end

  def go_n(magnitude)
    x, y = pos
    @pos = [x, y + magnitude]
  end

  def go_e(magnitude)
    x, y = pos
    @pos = [x + magnitude, y]
  end

  def go_s(magnitude)
    x, y = pos
    @pos = [x, y - magnitude]
  end

  def go_w(magnitude)
    x, y = pos
    @pos = [x - magnitude, y]
  end

  def go_f(magnitude)
    x, y = pos
    bx, by = bearing
    @pos = [x + (bx * magnitude), y + (by * magnitude)]
  end

  def go_l(degrees)
    current = bearings.index(@bearing)
    @bearing = bearings[(current - (degrees / 90)) % 4]
  end

  def go_r(degrees)
    go_l(360 - degrees)
  end

  def bearings
    [NORTH, EAST, SOUTH, WEST]
  end
end
