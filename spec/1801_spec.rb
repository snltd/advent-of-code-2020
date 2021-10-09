#!/usr/bin/env ruby

# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/1801'

# Problem 1801
#
class TestAdvent1801 < MiniTest::Test
  attr_reader :c

  def setup
    @c = Advent1801.new
  end

  def test_samples
    assert_equal(71, c.calculate('1 + 2 * 3 + 4 * 5 + 6'))
    assert_equal(26, c.calculate('2 * 3 + (4 * 5)'))
    assert_equal(437, c.calculate('5 + (8 * 3 + 9 + 3 * 4 * 3)'))
    assert_equal(
      12240,
      c.calculate('5 * 9 * (7 * 3 * 3 + 9 * 3 + (8 + 6 * 4))')
    )
    assert_equal(
      13632,
      c.calculate('((2 + 4 * 9) * (6 + 9 * 8 + 6) + 6) + 2 + 4 * 2')
    )
  end
end
