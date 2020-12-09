# frozen_string_literal: true

require_relative 'support/base'

# Problem 0902
#
class Advent0902 < Base
  attr_accessor :target

  def solve
    result = nil

    1.upto(input.size) do |i|
      result = try_from(i)
      break if result
    end

    result.max + result.min
  end

  def try_from(index)
    running_sum = 0
    sequence = [input[index]]

    while running_sum < target
      running_sum += input[index]
      sequence.<< input[index]
      return sequence if running_sum == target

      index += 1
    end

    false
  end

  def post_initialize
    @target = 14360655
  end
end
