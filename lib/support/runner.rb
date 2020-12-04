# frozen_string_literal: true

require_relative 'problem_loader'

# Solve a given problem
#
class Runner
  attr_reader :problem

  include ProblemLoader

  def initialize(problem)
    @problem = problem
    import_problem_class
  end

  def solution
    problem_class.new.solve
  end
end
