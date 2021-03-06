# frozen_string_literal: true

# Used in Day 5.
# You can easily turn the passport string into a binary value and convert it
# (see #cheaty_value) but I decided doing it that way went against the spirit
# of the exercise, so I re-implemented it the way it is done in the problem
# text.
#
class BinaryPartition
  def initialize(data, upper_char)
    @data = data
    @upper = upper_char
  end

  def value
    max = 2**@data.size
    range = Range.new(0, max, true).to_a

    @data.each_char do |c|
      range = c == @upper ? top_half(range) : bottom_half(range)
    end

    range.first
  end

  def top_half(arr)
    midpoint = arr.size / 2
    arr[midpoint..]
  end

  def bottom_half(arr)
    midpoint = arr.size / 2
    arr[...midpoint]
  end

  # I decided this was cheating.
  #
  def cheaty_value
    @data.gsub(@lower, '0').gsub(@upper, '1').to_i(2)
  end
end
