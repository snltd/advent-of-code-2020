# frozen_string_literal: true

require_relative 'support/base'

# Problem 1502
#
class Advent1502 < Base
  def solve
    @target = 30_000_000
    solve_for(input.first, @target)
  end

  def solve_for(input, stop_at)
    numeric_input = input.split(',').map(&:to_i)
    @memo = setup_memo(numeric_input)

    last_number = numeric_input.last

    Range.new(numeric_input.size, stop_at, true).each do |i|
      last_number = process(last_number, i)
    end

    last_number
  end

  def setup_memo(numeric_input)
    numeric_input[0..-2].each.with_index(1).with_object([]) do |(n, i), a|
      a[n.to_i] = i
    end
  end

  def process(num, index)
    next_num = @memo[num].nil? ? 0 : index - @memo[num]
    @memo[num] = index
    next_num
  end

  def input_style
    :as_lines
  end
end
