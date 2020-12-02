# frozen_string_literal: true

require 'pathname'
require_relative 'stdlib/array'

STORED_INPUT_DIR = Pathname.new(__dir__).parent + 'input'

# Stuff needed by multiple problems
#
class Base
  attr_reader :input

  def initialize(input = nil)
    raw_data = input || stored_input
    @input = numeric_input? ? numeric(raw_data) : raw_data
  end

  # Load input data from disk
  #
  def stored_input
    infile = STORED_INPUT_DIR + (problem.split('_'))[0]
    infile = STORED_INPUT_DIR + problem unless infile.exist?
    IO.read(infile).split("\n")
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
