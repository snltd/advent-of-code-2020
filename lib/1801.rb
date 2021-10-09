# frozen_string_literal: true

require_relative 'support/base'

# Problem 1801
#
class Advent1801 < Base
  def solve
    input.map { |i| calculate(i) }.sum
  end

  def input_style
    :as_lines
  end

  def calculate(raw)
    return calc_block(raw) unless raw.include?('(')

    calculate(raw.sub(/\(([^()]+)\)/) { calc_block(Regexp.last_match[1]) })
  end

  def calc_block(raw)
    args = raw.split
    tot = args.shift.to_i

    args.each_slice(2) do |op, arg|
      tot += arg.to_i if op == '+'
      tot *= arg.to_i if op == '*'
    end

    tot
  end
end
