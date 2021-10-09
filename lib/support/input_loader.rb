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
    @raw = stored_input(problem.to_s, dir)
  end

  def stored_input(problem, dir)
    infile = dir + problem[0..1]
    infile = dir + problem unless infile.exist?
    File.read(infile).strip
  end

  def as_lines
    raw.split("\n")
  end

  def as_integers
    as_lines.to_i
  end

  def as_raw_char_grid
    as_lines.map(&:chars)
  end

  def as_raw_grid
    as_lines.map(&:split)
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

  def as_asm
    as_lines.map do |l|
      instruction, arg = l.split
      [instruction.to_sym, arg.to_i]
    end
  end

  # @return [Array] plain text chunks, which were originally separated by
  #   blank lines. (NOT newlines!)
  def as_chunks
    raw.split(/^\s*$/).compact.map(&:strip)
  end
end
