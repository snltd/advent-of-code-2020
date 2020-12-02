# frozen_string_literal: true

require 'pathname'
require 'minitest/autorun'

PROBLEM_DIR = Pathname.new(__FILE__).dirname.parent + 'lib'
SAMPLE_INPUT_DIR = Pathname.new(__FILE__).dirname + 'input'

class BaseTest < MiniTest::Test
  def import_problem_class
    require PROBLEM_DIR + problem
  end

  def sample_input
    infile = SAMPLE_INPUT_DIR + problem
    IO.read(infile).split("\n")
  end
end
