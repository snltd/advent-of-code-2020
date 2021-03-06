# frozen_string_literal: true

require_relative 'support/base'

# Problem 0701
#
class Advent0701 < Base
  attr_reader :bag_map

  def wanted
    'shiny gold'
  end

  def solve
    set_up_data_stores

    to_solve = bag_map.reject { |bag| bag == wanted }

    expanded = to_solve.map do |bag, _how_many|
      e = expand(bag)
      @expanded[bag] = e
      e
    end

    expanded.count { |e| e.include?(wanted) }
  end

  def set_up_data_stores
    @bag_map = input.map { |bag| process_bag(bag) }.to_h
    @expanded = {} # cache things we've already worked out
  end

  def expand(bag)
    aggr = [bag]

    return aggr if bag == wanted || !bag_map.key?(bag)

    return @expanded[bag] if @expanded.key?(bag)

    bag_map[bag].each do |colour, how_many|
      aggr += expand(colour) unless how_many.zero?
    end

    aggr.uniq
  end

  def process_bag(line)
    bag_style, contents = line.gsub(/(bags?)|\./, '').split('contain')
    [bag_style.strip, hashified_contents(contents)]
  end

  def hashified_contents(contents)
    contents.split(',').map do |c|
      num, bag = c.strip.split(/\s+/, 2)
      [bag, num.to_i]
    end.to_h
  end

  def input_style
    :as_lines
  end
end
