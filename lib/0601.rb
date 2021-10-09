# frozen_string_literal: true

require_relative 'support/base'

# Problem 0601
#
class Advent0601 < Base
  def solve
    input.sum { |answers| yeses(answers) }
  end

  def yeses(answers)
    answers.gsub(/\s+/, '').chars.uniq.size
  end

  def input_style
    :as_chunks
  end
end
