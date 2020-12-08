# frozen_string_literal: true

require_relative 'support/base'
require_relative 'support/assembler'

# Problem 0802
#
class Advent0802 < Base
  def solve
    input.each_with_index do |_, i|
      new_prog = modify_program(input.dup, i)
      next if new_prog.nil?

      results = run_code(new_prog)
      return results[:accumulator] if results[:completed]
    end
  end

  def modify_program(input, index)
    inst, arg = input[index]

    case inst
    when :jmp
      input[index] = [:nop, arg]
    when :nop
      input[index] = [:jmp, arg]
    else
      return nil
    end

    input
  end

  def run_code(prog)
    asm = Assembler::Runtime.new(prog, loop_detector: true)
    asm.run!
  end

  def input_style
    :as_asm
  end
end
