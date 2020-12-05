# frozen_string_literal: true

require_relative 'support/base'

# Problem 0501
#
class Advent0501 < Base
  def solve
    input.map { |pass| seat_id(pass) }.max
  end

  def seat_id(pass)
    row = BinaryPartition.new(pass[0..6], upper: 'B', lower: 'F').value
    column = BinaryPartition.new(pass[7..10], upper: 'R', lower: 'L').value
    row * 8 + column
  end

  def input_style
    :as_lines
  end
end

# I don't know if this is cheating, but as the problem input is just binary in
# a minor disguise, we'll take a shortcut.
#
class BinaryPartition
  def initialize(data, options = {})
    @data = data
    @zero = options.fetch(:lower, 'F')
    @one = options.fetch(:upper, 'B')
  end

  def value
    @data.gsub(@zero, '0').gsub(@one, '1').to_i(2)
  end
end
