# frozen_string_literal: true

require 'pathname'

STORED_INPUT_DIR = Pathname.new(__dir__).parent + 'input'

# Stuff needed by multiple problems
#
class Base
  attr_reader :input

  def initialize(input = nil)
    @input = numeric(input || stored_input)
  end

  def stored_input
    infile = STORED_INPUT_DIR + problem
    IO.read(infile).split("\n")
  end

  def numeric(data)
    data.map(&:to_i)
  end
end
