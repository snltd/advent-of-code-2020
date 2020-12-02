#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative 'spec_helper'

# Problem 02_02
#
class ProblemTest0202 < BaseTest
  def problem
    '02_02'
  end

  def sample_answer
    1
  end

  def test_parse
    assert_equal(
      { letter: 'a',
        positions: [1, 3],
        password: 'abcde' },
      c.parse('1-3 a: abcde')
    )
  end

  def test_in_pos?
    assert c.in_pos?('a', 'abc', 1)
    refute c.in_pos?('b', 'abc', 1)
  end

  def test_valid?
    assert c.valid?(c.parse('1-3 a: abcde'))
    refute c.valid?(c.parse('1-3 b: cdefg'))
    refute c.valid?(c.parse('2-9 c: ccccccccc'))
  end

  def setup
    import_problem_class
    @c = Advent.new(sample_input)
  end

  def test_example_input
    assert_equal(sample_answer, c.solve)
  end
end
