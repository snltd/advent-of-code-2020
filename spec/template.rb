#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative 'spec_helper'

# Problem xx-yy
#
class ProblemTest < BaseTest
  def problem
    'xx-yy'
  end

  def sample_answer
    123
  end

  def test_example_input
    import_problem_class
    test = Advent.new(sample_input)
    assert_equal(sample_answer, test.solve)
  end
end
