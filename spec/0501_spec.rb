#!/usr/bin/env ruby

# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/0501'

# Problem 0501
#
class TestAdvent0501 < MiniTest::Test
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
