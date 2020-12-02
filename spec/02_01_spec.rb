#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative 'spec_helper'

# Problem 02_01
#
class ProblemTest0201 < BaseTest
  def problem
    '02_01'
  end

  def sample_answer
    2
  end

  def test_example_input
    import_problem_class
    test = Advent.new(sample_input)
    assert_equal(sample_answer, test.solve)
  end
end
