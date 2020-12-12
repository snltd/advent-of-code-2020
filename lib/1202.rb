# frozen_string_literal: true

require_relative 'support/base'

# Problem 1202
#
class Advent1202 < Base
  def solve
    nav = WaypointNavigator.new(input)
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
class WaypointNavigator
  attr_reader :raw, :waypoint_pos, :ship_pos, :bearing

  def initialize(input = [])
    @raw = input
    @ship_pos = [0, 0]
    @waypoint_pos = [10, 1] # relative to the ship
  end

  def parse
    raw.each do |instruction|
      direction = instruction[0].downcase
      magnitude = instruction[1..].to_i
      send("go_#{direction}", magnitude)
    end
  end

  def manhattan_distance
    ship_pos.map(&:abs).sum
  end

  def go_n(magnitude)
    x, y = waypoint_pos
    @waypoint_pos = [x, y + magnitude]
  end

  def go_e(magnitude)
    x, y = waypoint_pos
    @waypoint_pos = [x + magnitude, y]
  end

  def go_s(magnitude)
    x, y = waypoint_pos
    @waypoint_pos = [x, y - magnitude]
  end

  def go_w(magnitude)
    x, y = waypoint_pos
    @waypoint_pos = [x - magnitude, y]
  end

  def go_f(magnitude)
    wx, wy = waypoint_pos
    sx, sy = ship_pos

    @ship_pos = [sx + wx * magnitude, sy + wy * magnitude]
  end

  def go_l(degrees)
    x, y = waypoint_pos

    @waypoint_pos = case degrees
                    when 90
                      [-y, x]
                    when 180
                      [-x, -y]
                    when 270
                      [y, -x]
                    end
  end

  def go_r(degrees)
    go_l(360 - degrees)
  end
end
