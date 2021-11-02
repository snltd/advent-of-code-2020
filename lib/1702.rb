# frozen_string_literal: true

require 'stackprof'
require_relative 'support/base'

# Problem 1702. This is rubbish. It takes two hours.
#
class Advent1702 < Base
  attr_accessor :state

  def solve
    actives = []

    input.each.with_index do |row, i|
      row.each.with_index { |cell, j| actives.<<([i, j, 0, 0]) if cell == '#' }
    end.flatten.compact

    6.times { |_i| actives = cycle(actives) }

    actives.count
  end

  def neighbours(coords)
    matrix = [-1, 0, 1].repeated_permutation(coords.size).uniq

    matrix.map! { |n| [n, coords].transpose.map(&:sum) }.reject do |p|
      p == coords
    end
  end

  def cycle(actives)
    new_actives = []

    actives.each do |c|
      an = (neighbours(c) & actives).size
      new_actives.<< c if [2, 3].include?(an)
    end

    (all_cubes(actives) - actives).each do |c|
      an = (neighbours(c) & actives).size
      new_actives.<< c if an == 3
    end

    new_actives
  end

  def all_cubes(actives)
    x, y, z, w = limits(actives)

    x.each.with_object([]) do |x1, aggr|
      y.each do |y1|
        z.each do |z1|
          w.each do |w1|
            aggr.<< [x1, y1, z1, w1]
          end
        end
      end
    end
  end

  def limits(actives)
    0.upto(actives.first.size - 1).with_object([]) do |i, aggr|
      x = actives.map { |a| a[i] }
      aggr.<< Range.new(x.min - 1, x.max + 1).to_a
    end
  end

  def input_style
    :as_raw_char_grid
  end
end
