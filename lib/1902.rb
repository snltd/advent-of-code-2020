# frozen_string_literal: true

require_relative 'support/base'

# Problem 1902
#
class Advent1902 < Base
  def solve
    rules, messages = separate_input

    rules[8] = '42 | 42 8'
    rules[11] = '42 31 | 42 11 31'

    messages.count { |m| regex(rules).match?(m) }
  end

  def separate_input
    rules, messages = input.map { |l| l.split("\n") }

    rule_list = rules.each.with_object([]) do |r, aggr|
      i, r = r.split(/: /)
      aggr[i.to_i] = r.delete('"')
    end

    [rule_list, messages]
  end

  # rubocop:disable Metrics/MethodLength
  def expand_rule(rule_list, index, depth = 0)
    return nil if depth > 88

    rule_list[index].split.map do |r|
      ri = r.to_i

      if r.match(/^\d+$/)
        if %w[a b].include?(rule_list[ri])
          rule_list[ri]
        else
          [expand_rule(rule_list, ri, depth + 1)]
        end
      else
        r
      end
    end
  end
  # rubocop:enable Metrics/MethodLength

  def regex(rule_list)
    Regexp.new('^' + expand_rule(rule_list, 0)
      .to_s.gsub('[', '(')
      .gsub(']', ')')
      .delete('" ,') + '$')
  end

  def input_style
    :as_blocks
  end
end
