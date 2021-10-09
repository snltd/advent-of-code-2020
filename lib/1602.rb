# frozen_string_literal: true

require_relative 'support/base'

# Problem 1602
#
class Advent1602 < Base
  def solve
    rules = parse_rules(input.first)
    tickets = valid_tickets(parse_tickets(input.last), rules)

    categorise(tickets, rules).map { |r| r.count { |x| x == true } }
  end

  def categorise(tickets, rules)
    cols = columns(tickets)

    cols.map do |c|
      rules.to_a.map do |_name, r|
        (c - r).empty?
      end
    end

    # pp rules.to_a.permutation.size
    # exit

    # rules.to_a.permutation.each do |p|
    # x = cols.map.with_index do |c, i|
    # unless t
    # break
    # end
    # t
    # end
    #
    # #return p.map(&:first) if x.is_a?(Array) && x.all?
    # end
  end

  def columns(tickets)
    tickets.first.map.with_index { |_col, i| tickets.map { |t| t[i] } }
  end

  def valid_tickets(tickets, rules)
    tickets.select { |t| valid?(t, rules) }
  end

  def parse_data(_input)
    @badvals = []
  end

  def parse_rules(rules)
    rules.lines.map { |r| r.split(':') }.transform_values { |v| parse_rule(v) }
  end

  def parse_rule(rule)
    rule.split('or').map(&:strip).map do |r|
      low, high = r.split('-')
      Range.new(low.to_i, high.to_i).to_a
    end.flatten
  end

  def parse_tickets(tickets)
    tickets.lines[1..].map { |t| t.split(',') }.map(&:to_i)
  end

  def valid?(numbers, rules)
    numbers.all? { |n| rules.values.any? { |v| v.include?(n) } }
  end

  def input_style
    :as_chunks
  end
end
