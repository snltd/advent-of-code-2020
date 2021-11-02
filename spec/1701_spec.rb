#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative 'spec_helper'
require_relative '../lib/1701'

# Problem 1701
#
class TestAdvent1701 < MiniTest::Test
  include SpecHelper

  def sample_answer
    112
  end

  def test_limits
    assert_equal(
      [[-1, 0, 1, 2, 3], [-1, 0, 1, 2, 3], [-1, 0, 1]],
      c.limits([[0, 1, 0], [1, 2, 0], [2, 0, 0], [2, 1, 0], [2, 2, 0]]))
  end

  def test_neighbours
    assert_equal([[3], [5]], c.neighbours([4]))

    assert_equal([
      [2,2],
      [3,2],
      [3, 1],
      [3, 0],
      [2, 0],
      [1, 0],
      [1, 1],
      [1, 2]].sort, c.neighbours([2, 1]).sort)

    assert_equal(26, c.neighbours([4, 5, 6]).count)
    refute_includes(c.neighbours([4, 5, 6]), [4, 5, 6])
  end
end
