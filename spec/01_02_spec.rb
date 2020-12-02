#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative 'spec_helper'

# Problem 01-02
#
class ProblemTest < BaseTest
  def problem
    '01-02'
  end

  def sample_answer
    241861950
  end

  def test_example_input
    import_problem_class
    test = Advent.new(sample_input)
    assert_equal(sample_answer, test.solve)
  end
end
