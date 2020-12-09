# frozen_string_literal: true

require 'pathname'
require_relative 'input_loader'
require_relative 'constants'

# Stuff needed by multiple problems
#
class Base
  attr_reader :input

  def initialize(input_dir = STORED_INPUT_DIR)
    @input = InputLoader.new(problem, input_dir).send(input_style)
    post_initialize if respond_to?(:post_initialize)
  end

  def problem
    self.class.name.sub('Advent', '')
  end

  # We'll assume the input to a problem is a list of integers. If it's not,
  # and must be treated as a string, set a different input style in the
  # calling class. The value must be a symbol which refers to a method in the
  # InputLoader class
  #
  def input_style
    :as_integers
  end
end
