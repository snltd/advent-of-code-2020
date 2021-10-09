# frozen_string_literal: true

require_relative 'support/base'

# Problem 1701
#
class Advent1701 < Base
  def solve
    active = setup(input)

    active.each do |point|
      # if neighbours(point)
    end
  end

  def setup(input, z = 0)
    ret = []

    input.each_with_index do |row, y|
      row.each_with_index do |char, x|
        ret.<<([x, y, z]) if char == '#'
      end
    end

    ret
  end

  # rubocop:disable Metrics/MethodLength
  def neighbours(point)
    x, y, z = point
    ret = []

    (-1).upto(1) do |a|
      (-1).upto(1) do |b|
        (-1).upto(1) do |c|
          ret.<<([x + a, y + b, y + c])
        end
      end
    end

    ret.uniq
    ret.delete([x, y, z])
    ret
  end
  # rubocop:enable Metrics/MethodLength

  def input_style
    :as_raw_char_grid
  end
end
