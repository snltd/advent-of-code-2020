# frozen_string_literal: true

require_relative 'support/base'

# Problem 1302
#
class Advent1302 < Base
  def solve
    123
  end

  def decoded(i)
    i.split(',').map.with_index { |n, i| [i, n.to_i] }
     .reject { |_a, b| b.zero? }
  end

  def part2_again(times)
    offset = 0
    period = times[0][1]

    times.each do |t|
      offset += period while (offset + t[0]) % t[1] != 0
      period *= t[1]
    end

    pp(times, offset)
    offset
  end

  def solve_for(input)
    dec = decoded(input)

    part2_again(dec)
  end
end
