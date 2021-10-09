# frozen_string_literal: true

require_relative 'support/base'

# Problem 1802
#
# It's a child's homework. I trust the input.
# rubocop:disable Security/Eval
class Advent1802 < Base
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
    return eval(raw) unless raw.include?('+')

    calc_block(raw.gsub(/(\d+ \+ \d+)/) { eval(Regexp.last_match[1]) })
  end
end
# rubocop:enable Security/Eval
