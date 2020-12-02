# frozen_string_literal: true

# Load input data from disk. Automatically handles a single input (01) or
# multiple inputs (01-01, 01-02) for a problem.
# @param dir [Pathname] base directory for input files
# @return [Array[String]]
#
module InputLoader
  def stored_input(dir)
    infile = dir + problem[0..1]
    infile = dir + problem unless infile.exist?
    IO.read(infile).split("\n")
  end
end
