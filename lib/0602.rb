# frozen_string_literal: true

require_relative 'support/base'

# Problem 0602
#
class Advent0602 < Base
  def solve
    input.sum { |q| unanimous_yeses(q) }
  end

  def unanimous_yeses(answers)
    people = answers.split("\n")
    all_answers(answers).count { |q| people.all? { |p| p.include?(q) } }
  end

  def all_answers(answers)
    answers.gsub(/\s+/, '').chars.uniq
  end

  def input_style
    :as_chunks
  end
end
