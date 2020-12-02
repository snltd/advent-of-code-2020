# frozen_string_literal: true

require 'pathname'
require 'minitest/autorun'
require_relative '../lib/support/input_loader'
require_relative '../lib/support/problem_loader'

module SpecHelper
  attr_reader :c

  include InputLoader
  include ProblemLoader

  def setup
    import_problem_class
    @c = problem_class.new(stored_input(SAMPLE_INPUT_DIR))
  end

  def problem
    self.class.name.sub('ProblemTest', '')
  end

  def test_example_input
    assert_equal(sample_answer, c.solve)
  end
end
