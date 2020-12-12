#!/usr/bin/env ruby

# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../lib/support/constants'
require_relative '../../lib/support/input_loader'
require_relative '../../lib/support/seat_map'

# For Day 11
class TestSeatMap < Minitest::Test
  attr_reader :c

  def setup
    input = InputLoader.new(11, SAMPLE_INPUT_DIR).as_raw_char_grid
    @c = SeatMap.new(input)
  end

  def test_iterate
    actual = c.iterate

    test_steps.each do |expected|
      assert_equal(expected.delete(' '), stringify(actual))
      actual = SeatMap.new(actual).iterate
    end
  end

  def stringify(seatmap)
    seatmap.map(&:join).join("\n")
  end

  def test_adjacent_to
    assert_equal([[1, 1], [2, 1], [3, 1],
                  [1, 2], [3, 2],
                  [1, 3], [2, 3], [3, 3]], c.adjacent_to(2, 2))

    assert_equal([[1, 0], [0, 1], [1, 1]], c.adjacent_to(0, 0))
  end

  def test_on_map?
    assert c.on_map?(0, 0)
    assert c.on_map?(4, 2)
    assert c.on_map?(9, 9)
    refute c.on_map?(-1, 0)
    refute c.on_map?(10, 0)
    refute c.on_map?(1, 10)
  end

  def test_occupied
    c = SeatMap.new([
                      %w[# . L],
                      %w[. L #],
                      %w[. # #]
                    ])

    assert_equal(4, c.occupied(c.adjacent_to(1, 1)))
  end

  def test_occupied?
    c = SeatMap.new([%w[# . L], %w[. # #]])
    assert c.occupied?(0, 0)
    assert c.occupied?(2, 1)
    refute c.occupied?(1, 0)
    refute c.occupied?(2, 0)
  end

  def test_steps
    ['#.##.##.##
      #######.##
      #.#.#..#..
      ####.##.##
      #.##.##.##
      #.#####.##
      ..#.#.....
      ##########
      #.######.#
      #.#####.##',

     '#.LL.L#.##
      #LLLLLL.L#
      L.L.L..L..
      #LLL.LL.L#
      #.LL.LL.LL
      #.LLLL#.##
      ..L.L.....
      #LLLLLLLL#
      #.LLLLLL.L
      #.#LLLL.##',

     '#.##.L#.##
      #L###LL.L#
      L.#.#..#..
      #L##.##.L#
      #.##.LL.LL
      #.###L#.##
      ..#.#.....
      #L######L#
      #.LL###L.L
      #.#L###.##',

     '#.#L.L#.##
      #LLL#LL.L#
      L.L.L..#..
      #LLL.##.L#
      #.LL.LL.LL
      #.LL#L#.##
      ..L.L.....
      #L#LLLL#L#
      #.LLLLLL.L
      #.#L#L#.##',

     '#.#L.L#.##
      #LLL#LL.L#
      L.#.L..#..
      #L##.##.L#
      #.#L.LL.LL
      #.#L#L#.##
      ..L.L.....
      #L#L##L#L#
      #.LLLLLL.L
      #.#L#L#.##']
  end
end
