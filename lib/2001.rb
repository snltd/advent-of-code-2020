# frozen_string_literal: true

require_relative 'support/base'

# Problem 2001
#
class Advent2001 < Base
  def solve
    find_corners(to_tiles)
  end

  def find_corners(tiles)
    tile_edges = tiles.transform_values { |t| edges(t) }

    all_edges = tile_edges.each_with_object([]) do |(_k, v), aggr|
      aggr.<< (v[:normal] + v[:flipped])
    end.flatten

    counts = tile_edges.each_with_object([]) do |(k, v), aggr|
      s = 0
      v[:normal].each { |e| s += all_edges.count(e) }
      v[:flipped].each { |e| s += all_edges.count(e) }

      aggr.<< [s, k]
    end

    counts.sort.take(4).map { |_k, v| v }.inject(:*)
  end

  def edges(tile)
    { normal: [tile.first,
               tile.map { |r| r[-1] }.join,
               tile.last.reverse,
               tile.map { |r| r[0] }.join.reverse],
      flipped: [tile.first.reverse,
                tile.map { |r| r[-1] }.join.reverse,
                tile.last,
                tile.map { |r| r[0] }.join] }
  end

  def to_tiles
    input.each_with_object({}) do |tile, ret|
      lines = tile.split("\n")
      header = lines.shift
      ret[header.match(/\d+/)[0].to_i] = lines
    end
  end

  def input_style
    :as_blocks
  end
end
