#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative 'spec_helper'

# Problem 1201
#
class ProblemTest1201 < MiniTest::Test
  include SpecHelper

  def sample_answer
    25
  end
end

require_relative '../lib/1201'

class TestNavigator < MiniTest::Test
  attr_reader :c

  EAST = [1, 0].freeze
  SOUTH = [0, -1].freeze
  WEST = [-1, 0].freeze
  NORTH = [0, 1].freeze

  def setup
    @c = Navigator.new
  end

  def test_go_r
    assert_equal(EAST, c.bearing)
    c.go_r(180)
    assert_equal(WEST, c.bearing)
    c.go_r(90)
    assert_equal(NORTH, c.bearing)
    c.go_r(270)
    assert_equal(WEST, c.bearing)
    c.go_r(270)
    assert_equal(SOUTH, c.bearing)
  end

  def test_go_l
    assert_equal(EAST, c.bearing)
    c.go_l(90)
    assert_equal(NORTH, c.bearing)
    c.go_l(180)
    assert_equal(SOUTH, c.bearing)
    c.go_l(270)
    assert_equal(WEST, c.bearing)
    c.go_l(360)
    assert_equal(WEST, c.bearing)
  end
end
