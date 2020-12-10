# frozen_string_literal: true

require_relative 'support/base'

# Problem 1001
#
class Advent1001 < Base
  def solve
    diffs(input, 1) * diffs(input, 3)
  end

  # Brackets @list with 0 (the joltage of the outlet) and the highest joltage
  # + 3 (the input of the device)
  # @return the number of steps in @list equal to @diff
  def diffs(list, diff)
    list += [0, list.max + 3]
    list.sort.each_cons(2).select { |a, b| b - a == diff }.count
  end
end
