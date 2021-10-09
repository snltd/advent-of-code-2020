# frozen_string_literal: true

require_relative 'support/base'

# Problem 1601
#
class Advent1601 < Base
  def solve
    rules = parse_rules(input.first)

    parse_tickets(input.last).each_with_object([]) do |t, aggr|
      aggr.concat(validate_ticket(t, rules))
    end.sum
  end

  def parse_rules(rules)
    rules.lines.map { |r| r.split(':') }.to_h.transform_values do |v|
      parse_rule(v)
    end
  end

  def parse_rule(rule)
    rule.split('or').map(&:strip).map do |r|
      low, high = r.split('-')
      Range.new(low.to_i, high.to_i).to_a
    end.flatten
  end

  def parse_tickets(tickets)
    tickets.lines.map { |t| t.split(',') }.map(&:to_i)
  end

  def validate_ticket(numbers, rules)
    numbers.reject { |n| rules.values.any? { |v| v.include?(n) } }
  end

  def input_style
    :as_chunks
  end
end
