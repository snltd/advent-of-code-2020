# frozen_string_literal: true

require_relative 'seat_map'

# An extension of the original SeatMap class, applying slightly different
# rules
#
class SeatMap2 < SeatMap
  def apply_rules(x, y)
    return FLOOR if floor?(x, y)

    visible_occupied = occupied(visible_from(x, y))

    if occupied?(x, y)
      visible_occupied >= 5 ? EMPTY : OCCUPIED
    else
      visible_occupied.zero? ? OCCUPIED : EMPTY
    end
  end

  # @return the coordinates of all seats in the line of sight from the given
  # coordinate.
  #
  def visible_from(x, y)
    adjacent.map { |dx, dy| first_in_line_of_sight(x, y, dx, dy) }.compact
  end

  def first_in_line_of_sight(x, y, dx, dy)
    px = x + dx
    py = y + dy
    return nil unless on_map?(px, py)

    return [px, py] unless floor?(px, py)

    first_in_line_of_sight(px, py, dx, dy)
  end
end
