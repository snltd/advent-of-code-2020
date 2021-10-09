#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative 'spec_helper'

# Problem 1701
#
class TestAdvent1701 < MiniTest::Test
  include SpecHelper

  def sample_answer
    112
  end

  def test_setup
    assert_equal([[1, 0, 0], [2, 1, 0], [0, 2, 0], [1, 2, 0], [2, 2, 0]],
                 c.setup(c.input))
  end

  def test_neighbours
    assert_equal(26, c.neighbours([1, 2, 3]).size)
    assert_includes(c.neighbours([1, 2, 3]), [2, 2, 2])
    assert_includes(c.neighbours([1, 2, 3]), [0, 2, 3])
  end
end
