# frozen_string_literal: true

require_relative 'support/base'

# Problem 1401
#
class Advent1401 < Base
  def solve
    mi = MaskedInterpreter.new(input)
    mi.run
    mi.memsums
  end

  def input_style
    :raw
  end
end

# Solve 1401
#
class MaskedInterpreter
  attr_reader :mem, :prog

  def initialize(prog = '')
    @prog = prog
    @mask = nil
    @mem = {}
  end

  def memsums
    mem.values.sum
  end

  def run
    prog.split("\n").each do |line|
      line.start_with?('mask') ? update_mask(line) : run_inst(line)
    end
  end

  def run_inst(line)
    matches = line.match(/\[(\d+)\] = (\d+)/)
    @mem[matches[1]] = masked_num(@mask, matches[2]).to_i(2)
  end

  def update_mask(line)
    @mask = line.split.last
  end

  def masked_num(mask, num)
    full_bin(num).each_char.with_index.with_object([]) do |(c, i), s|
      s.<<(%w[0 1].include?(mask[i]) ? mask[i] : c)
    end.join
  end

  def full_bin(num)
    format('%036d', num.to_i.to_s(2))
  end
end
