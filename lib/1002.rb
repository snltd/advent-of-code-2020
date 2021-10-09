# frozen_string_literal: true

require_relative 'support/base'

# Problem 1002
# I couldn't solve this on my own. It turns out there's this thing called the
# Tribonacci Sequence, which tells you how many combinations of adapters can
# make up a given step in joltage. This was no fun at all, and reminded me
# that I am just a dumb-ass sys-admin. All I did here was implement the steps
# of someone else's algorithm.
#
class Advent1002 < Base
  def solve
    run_lengths(diffs(input)).map { |i| tribonacci_sequence[i] }.reduce(:*)
  end

  private

  def tribonacci_sequence
    [0, 1, 2, 4, 7, 13]
  end

  # Make a list of all the differences between consecutive elements of the
  # sorted input. The actual values don't matter, only the runs of consecutive
  # numbers.
  #
  def diffs(list)
    list += [0, list.max + 3]
    list.sort.each_cons(2).with_object([]) { |(a, b), aggr| aggr.<< (b - a) }
  end

  # Given a list of numbers like [3, 1, 1, 3, 1, 1], return a list of the
  # lengths of the runs of 1s.  The input only produces gaps of 1 or 3.
  # Apparently this solution wouldn't work if it didn't, but don't ask me to
  # explain why.
  #
  def run_lengths(list)
    list.join.split(/3+/).map(&:size)
  end
end
