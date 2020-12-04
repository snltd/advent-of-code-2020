# frozen_string_literal: true

require_relative 'grid'
require_relative 'stdlib/array'

# Load input data from disk. Automatically handles a single input (01) or
# multiple inputs (01-01, 01-02) for a problem.
# @param dir [Pathname] base directory for input files
# @return [Array[String]]
#
class InputLoader
  attr_reader :raw

  def initialize(problem, dir)
    @raw = stored_input(problem, dir)
  end

  def stored_input(problem, dir)
    infile = dir + problem[0..1]
    infile = dir + problem unless infile.exist?
    IO.read(infile).split("\n")
  end

  def as_integers
    raw.to_i
  end

  def as_raw_char_grid
    raw.map { |r| r.split('') }
  end

  def as_raw_grid
    raw.map(&:split)
  end

  def as_raw_integer_grid
    as_raw_grid.map(&:to_i)
  end

  def as_grid
    Grid.new(as_raw_grid, {})
  end

  def as_integer_grid
    Grid.new(as_raw_integer_grid, {})
  end
end
