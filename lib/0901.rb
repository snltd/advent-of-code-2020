# frozen_string_literal: true

require_relative 'support/base'

# Problem 0901
#
class Advent0901 < Base
  attr_accessor :window_size # so the tests can override it

  def solve
    offset = window_size

    while offset < input.size
      offset += 1
      num = input[offset]
      window = preamble(offset, window_size)

      return num unless addends?(num, window)
    end
  end

  def post_initialize
    @window_size = 25
  end

  def preamble(offset, window_size)
    window_end = offset - 1
    window_start = offset - window_size
    input[window_start..window_end]
  end

  def addends?(value, input)
    input.each do |n|
      return true if input.include?(value - n) && value != n * 2
    end

    false
  end
end
