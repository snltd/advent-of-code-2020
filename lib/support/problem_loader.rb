# frozen_string_literal: true

require_relative 'constants'

# Load in the class which solves a problem. #problem must exist in the
# including class
#
module ProblemLoader
  def import_problem_class
    require PROBLEM_DIR + problem
  end

  def problem_class
    Object.const_get("Advent#{problem}")
  end
end
