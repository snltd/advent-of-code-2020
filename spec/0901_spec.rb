#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative 'spec_helper'

# Problem 0901
#
class ProblemTest0901 < MiniTest::Test
  include SpecHelper

  def sample_answer
    127
  end

  def post_setup
    c.window_size = 5
  end

  def test_addends_ex1
    range = Range.new(1, 25)

    assert c.addends?(26, range)
    assert c.addends?(49, range)
    refute c.addends?(100, range)
    refute c.addends?(50, range)
  end

  def test_addends_ex2
    range = Range.new(1, 25).to_a.<< 45
    range.delete(20)
    assert c.addends?(26, range)
    refute c.addends?(65, range)
    assert c.addends?(64, range)
    assert c.addends?(66, range)
  end

  def test_preamble
    assert_equal([35, 20, 15], c.preamble(3, 3))
    assert_equal([55, 65, 95, 102], c.preamble(11, 4))
  end
end
