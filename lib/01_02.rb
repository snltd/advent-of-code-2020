# frozen_string_literal: true

require_relative 'base'

# Problem 01-02
#
class Advent < Base
  def problem
    '01_02'
  end

  def solve
    numbers_which_sum_to(2020, input).reduce(:*)
  end

  # This should be done recursively, but it's very late and I'm very tired.
  # Maybe I'll do it properly tomorrow.
  #
  def numbers_which_sum_to(value, input, _aggr = [])
    input.each do |n|
      number_remaining = value - n
      elements_remaining = input.reject { |v| v == n }

      elements_remaining.each do |p|
        number_now_remaining = number_remaining - p
        next unless elements_remaining.include?(number_now_remaining)

        return [n, p, number_now_remaining]
      end
    end
  end
end
