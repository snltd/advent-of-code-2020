# frozen_string_literal: true

require_relative 'base'

# Problem 01-02
#
class Advent < Base
  def problem
    '01-02'
  end

  def solve
    numbers_which_sum_to(2020, input).reduce(:*)
  end

  def numbers_which_sum_to(value, input, _aggr = [])
    input.each { |n| return [n, value - n] if input.include?(value - n) }
  end
end
