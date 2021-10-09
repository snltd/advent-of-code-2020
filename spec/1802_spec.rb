#!/usr/bin/env ruby

# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/1802'

# Problem 1802
#
class TestAdvent1802 < MiniTest::Test
  attr_reader :c

  def setup
    @c = Advent1802.new
  end

  def test_samples
    assert_equal(231, c.calculate('1 + 2 * 3 + 4 * 5 + 6'))
    assert_equal(51, c.calculate('1 + (2 * 3) + (4 * (5 + 6))'))
    assert_equal(1445, c.calculate('5 + (8 * 3 + 9 + 3 * 4 * 3)'))
    assert_equal(669060,
                 c.calculate('5 * 9 * (7 * 3 * 3 + 9 * 3 + (8 + 6 * 4))'))
    assert_equal(23340, c.calculate(
                          '((2 + 4 * 9) * (6 + 9 * 8 + 6) + 6) + 2 + 4 * 2'
                        ))
  end
end
