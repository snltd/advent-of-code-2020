# frozen_string_literal: true

require 'pathname'
require_relative 'stdlib/array'
require_relative 'input_loader'

# Stuff needed by multiple problems
#
class Base
  attr_reader :input

  include InputLoader

  def initialize(input = nil)
    raw_data = input || stored_input(STORED_INPUT_DIR)
    @input = numeric_input? ? numeric(raw_data) : raw_data
  end

  def problem
    self.class.name.sub('Advent', '')
  end

  # Turn something into a load of integers
  #
  def numeric(data)
    data.to_i
  end

  # We'll assume the input to a problem is numeric. If it's not, and must be
  # treated as a string, set this to false in the inheriting class
  #
  def numeric_input?
    true
  end
end
