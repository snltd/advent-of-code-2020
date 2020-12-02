#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative 'spec_helper'

# Problem 01-01
#
class ProblemTest0101 < BaseTest
  def problem
    '01_01'
  end

  def sample_answer
    514579
  end

  def test_example_input
    import_problem_class
    test = Advent.new(sample_input)
    assert_equal(sample_answer, test.solve)
  end
end
