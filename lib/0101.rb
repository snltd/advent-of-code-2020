# frozen_string_literal: true

require_relative 'support/base'

# Problem 0101
#
class Advent0101 < Base
  def problem
    '0101'
  end

  def solve
    numbers_which_sum_to(2020, input.to_i).reduce(:*)
  end

  def numbers_which_sum_to(value, input, _aggr = [])
    input.each { |n| return [n, value - n] if input.include?(value - n) }
  end
end
