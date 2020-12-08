#!/usr/bin/env ruby

# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../lib/support/assembler'

# Test the guts of the assembler. The public interfaces are also exercised by
# the problem tests in the parent directory.
#
class AssemblerRuntimeTest < MiniTest::Test

  # NOP should move on to the next instruction, not changing the accumulator
  def test_nop
    c = Assembler::Runtime.new([[:nop, 0], [:nop, 0]])
    c.run!
    assert_equal(2, c.pc)
    assert_equal(0, c.acl)
  end

  # ACC should move on to the next instruction, and add the argument's
  # value to the accumulator
  def test_acc
    c = Assembler::Runtime.new([[:acc, 5], [:acc, -2]])
    c.run!
    assert_equal(2, c.pc)
    assert_equal(3, c.acl)
  end

  # JMP should add the argument's value to the program counter, leaving the
  # accumulator unaffected
  #
  def test_jmp
    c = Assembler::Runtime.new([[:jmp, 2], [:acc, 1], [:acc, 2]])
    c.run!
    assert_equal(3, c.pc)
    assert_equal(2, c.acl)
  end

  def _test_loop_detector
    c = Assembler::Runtime.new([[:nop, 0], [:jmp, 0]], loop_detector: true)
    result = c.run!

    assert_equal(0, result[:accumulator])
    refute result[:completed]
    assert_equal('loop detected at index 1', result[:error])
  end
end
