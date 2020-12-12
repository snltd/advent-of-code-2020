#!/usr/bin/env ruby

# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../lib/support/binary_partition'

# Test the meat of Day 5's solutions
#
class TestBinaryPartition < MiniTest::Test
  def test_fb
    c = BinaryPartition.new('FBFBBFF', 'B')
    assert_equal(44, c.value)
  end

  def test_rl
    c = BinaryPartition.new('RLR', 'R')
    assert_equal(5, c.value)
  end
end
