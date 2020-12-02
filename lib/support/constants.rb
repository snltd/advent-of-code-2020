# frozen_string_literal: true

require 'pathname'

ROOT = Pathname.new(__dir__).parent.parent
PROBLEM_DIR = ROOT + 'lib'
STORED_INPUT_DIR = ROOT + 'input'
SAMPLE_INPUT_DIR = ROOT + 'spec' + 'input'
