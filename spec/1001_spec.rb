#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative 'spec_helper'

# Problem 1001
#
class TestAdvent1001 < MiniTest::Test
  include SpecHelper

  def sample_answer
    220
  end

  def test_diffs
    assert_equal(5, c.diffs([1, 2, 5, 6, 7, 8], 1))
    assert_equal(7, c.diffs(little_example, 1))
    assert_equal(5, c.diffs(little_example, 3))
    assert_equal(22, c.diffs(c.input, 1))
    assert_equal(10, c.diffs(c.input, 3))
  end

  def little_example
    [16, 10, 15, 5, 1, 11, 7, 19, 6, 12, 4]
  end
end
