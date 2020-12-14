# frozen_string_literal: true

require_relative 'support/base'

# Problem 1301
#
class Advent1301 < Base
  def solve
    solve_for(input.first.to_i,
              input.last.split(',').reject { |i| i == 'x' }.map(&:to_i))
  end

  def solve_for(ts, ids)
    ids.map { |i| [i, i - (ts % i)] }.min { |a, b| a[1] <=> b[1] }.reduce(:*)
  end

  def input_style
    :as_lines
  end
end
