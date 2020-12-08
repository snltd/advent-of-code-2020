# frozen_string_literal: true

require_relative 'support/base'
require_relative 'support/assembler'

# Problem 0801
#
class Advent0801 < Base
  def solve
    asm = Assembler::Runtime.new(input, loop_detector: true)
    asm.run!
    asm.acl
  end

  def input_style
    :as_asm
  end
end
