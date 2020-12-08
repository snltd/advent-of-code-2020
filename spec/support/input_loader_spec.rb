#!/usr/bin/env ruby
# frozen_string_literal: true

require 'pathname'
require 'minitest/autorun'
require_relative '../../lib/support/input_loader'

TEST_INPUT_DIR = Pathname.new(__dir__) + 'resources'

# Test the input loader
#
class TestInputLoader < MiniTest::Test
  def test_raw
    c = InputLoader.new('01', TEST_INPUT_DIR)
    assert_equal("3\n5\n7\n9", c.raw)
  end

  def test_as_lines
    c = InputLoader.new('01', TEST_INPUT_DIR)
    assert_equal(%w[3 5 7 9], c.as_lines)
  end

  def test_as_integers
    c = InputLoader.new('01', TEST_INPUT_DIR)
    assert_equal([3, 5, 7, 9], c.as_integers)
  end

  def test_two_parter
    part1 = InputLoader.new('0201', TEST_INPUT_DIR)
    part2 = InputLoader.new('0202', TEST_INPUT_DIR)

    assert_equal([1, 2, 3, 4], part1.as_integers)
    assert_equal([5, 6, 7, 8], part2.as_integers)
  end

  def test_as_grid
    c = InputLoader.new('0301', TEST_INPUT_DIR)
    assert_instance_of(Grid, c.as_grid)
  end

  def test_as_integer_grid
    c = InputLoader.new('0302', TEST_INPUT_DIR)
    assert_instance_of(Grid, c.as_integer_grid)
  end

  def test_as_raw_char_grid
    c = InputLoader.new('04', TEST_INPUT_DIR)
    assert_equal(
      [%w[a b c],
       %w[d e f],
       %w[g h i]], c.as_raw_char_grid
    )
  end

  def test_as_raw_grid
    c = InputLoader.new('0301', TEST_INPUT_DIR)
    assert_equal(
      [%w[a b c],
       %w[d e f],
       %w[g h i]], c.as_raw_grid
    )
  end

  def test_as_raw_integer_grid
    c = InputLoader.new('0302', TEST_INPUT_DIR)
    assert_equal(
      [[1, 2, 3],
       [4, 5, 6],
       [7, 8, 9]], c.as_raw_integer_grid
    )
  end

  def test_as_chunks
    c = InputLoader.new('05', TEST_INPUT_DIR)
    assert_equal(
      ["chunk 0 line 0\nchunk 0 line 1",
       'chunk 1',
       "chunk 2 line 0\nchunk 2 line 1",
       'chunk 3'], c.as_chunks
    )
  end

  def test_as_asm
    c = InputLoader.new('08', TEST_INPUT_DIR)
    assert_equal(
      [[:nop, 0],
       [:acc, 3],
       [:jmp, -3]], c.as_asm)
  end
end
