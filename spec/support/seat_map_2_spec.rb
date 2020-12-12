#!/usr/bin/env ruby
# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../lib/support/constants'
require_relative '../../lib/support/input_loader'
require_relative '../../lib/support/seat_map_2'

# Tests for Day 11 part 2
#
class TestSeatMap2 < MiniTest::Test
  attr_reader :c

  def setup
    input = InputLoader.new(11, SAMPLE_INPUT_DIR).as_raw_char_grid
    @c = SeatMap2.new(input, 5)
  end

  def test_iterate
    actual = c.iterate

    test_steps.each_with_index do |expected, _i|
      assert_equal(expected.delete(' '), stringify(actual))
      actual = SeatMap2.new(actual).iterate
    end
  end

  def test_occupied
    c = SeatMap2.new(['###'.split(''),
                      '.#.'.split(''),
                      'LL.'.split(''),
                      '.L#'.split('')])

    assert_equal(2, c.occupied(c.visible_from(1, 2)))
    assert_equal(2, c.occupied(c.visible_from(0, 0)))
    assert_equal(1, c.occupied(c.visible_from(1, 3)))
  end

  def test_visible_from1
    c = SeatMap2.new(['.......#.'.split(''),
                      '...#.....'.split(''),
                      '.#.......'.split(''),
                      '.........'.split(''),
                      '..#L....#'.split(''),
                      '....#....'.split(''),
                      '.........'.split(''),
                      '#........'.split(''),
                      '...#.....'.split('')])

    assert_equal(
      [[7, 0],
       [3, 1],
       [1, 2],
       [2, 4], [8, 4],
       [4, 5],
       [0, 7],
       [3, 8]].sort, c.visible_from(3, 4).sort
    )
  end

  def test_visible_from2
    c = SeatMap2.new(['.............'.split(''),
                      '.L.L.#.#.#.#.'.split(''),
                      '.............'.split('')])

    assert_equal([[3, 1]], c.visible_from(1, 1))
  end

  def test_visible_from3
    c = SeatMap2.new(['.##.##.'.split(''),
                      '#.#.#.#'.split(''),
                      '##...##'.split(''),
                      '...L...'.split(''),
                      '##...##'.split(''),
                      '#.#.#.#'.split(''),
                      '.##.##.'.split('')])

    assert_empty(c.visible_from(3, 3))
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

     '#.LL.LL.L#
     #LLLLLL.LL
     L.L.L..L..
     LLLL.LL.LL
     L.LL.LL.LL
     L.LLLLL.LL
     ..L.L.....
     LLLLLLLLL#
     #.LLLLLL.L
     #.LLLLL.L#',

     '#.L#.##.L#
     #L#####.LL
     L.#.#..#..
     ##L#.##.##
     #.##.#L.##
     #.#####.#L
     ..#.#.....
     LLL####LL#
     #.L#####.L
     #.L####.L#',

     '#.L#.L#.L#
     #LLLLLL.LL
     L.L.L..#..
     ##LL.LL.L#
     L.LL.LL.L#
     #.LLLLL.LL
     ..L.L.....
     LLLLLLLLL#
     #.LLLLL#.L
     #.L#LL#.L#',

     '#.L#.L#.L#
     #LLLLLL.LL
     L.L.L..#..
     ##L#.#L.L#
     L.L#.#L.L#
     #.L####.LL
     ..#.#.....
     LLL###LLL#
     #.LLLLL#.L
     #.L#LL#.L#',

     '#.L#.L#.L#
     #LLLLLL.LL
     L.L.L..#..
     ##L#.#L.L#
     L.L#.LL.L#
     #.LLLL#.LL
     ..#.L.....
     LLL###LLL#
     #.LLLLL#.L
     #.L#LL#.L#']
  end

  def stringify(seatmap)
    seatmap.map(&:join).join("\n")
  end
end
