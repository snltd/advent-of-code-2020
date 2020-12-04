# frozen_string_literal: true

require_relative 'support/base'

# Problem 0201
#
# Each item of input looks like '1-3 a: abcde'. The fields are a range, a
# letter, and a string. The number of times the letter appears in the string
# must be in the range.
#
class Advent0201 < Base
  def solve
    processed_input.count do |row|
      row[:range].include?(row[:password].count(row[:letter]))
    end
  end

  def processed_input
    input.map do |row|
      range, letter, password = row.split(/[\s:]+/)

      { letter: letter,
        range: Range.new(*range.split('-').to_i),
        password: password }
    end
  end

  def input_style
    :as_lines
  end
end
