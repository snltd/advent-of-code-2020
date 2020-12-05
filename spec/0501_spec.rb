#!/usr/bin/env ruby

# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/0501'

# Problem 0501
#
class ProblemTest0501 < MiniTest::Test
  attr_reader :c

  def setup
    @c = Advent0501.new
  end

  def test_samples
    assert_equal(357, c.seat_id('FBFBBFFRLR'))
    assert_equal(567, c.seat_id('BFFFBBFRRR'))
    assert_equal(119, c.seat_id('FFFBBBFRRR'))
    assert_equal(820, c.seat_id('BBFFBBFRLL'))
  end
end

# Tests for the class which does the work
#
class BinaryPartitionTest < MiniTest::Test
  def test_fb
    c = BinaryPartition.new('FBFBBFF')
    assert_equal(44, c.value)
  end

  def test_rl
    c = BinaryPartition.new('RLR', lower: 'L', upper: 'R')
    assert_equal(5, c.value)
  end
end
