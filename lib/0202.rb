# frozen_string_literal: true

require_relative 'support/base'

# Problem 0202
#
# Each item of input looks like '1-3 a: abcde'. The fields are: two positions,
# a letter, and a string. The letter must occur at ONE OF the two positions in
# the string. String offsets begin at 1!
#
class Advent0202 < Base
  def solve
    processed_input.count { |item| valid?(item) }
  end

  def valid?(item)
    item[:positions].count do |p|
      in_pos?(item[:letter], item[:password], p)
    end == 1
  end

  def in_pos?(letter, string, offset)
    letter == string[offset - 1]
  end

  def processed_input
    input.map { |row| parse(row) }
  end

  def parse(raw)
    range, letter, password = raw.split(/[\s:]+/)

    { letter: letter,
      positions: range.split('-').to_i,
      password: password }
  end

  def input_style
    :as_lines
  end
end
