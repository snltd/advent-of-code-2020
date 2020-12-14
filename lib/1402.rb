# frozen_string_literal: true

require_relative 'support/base'

# Problem 1402
#
class Advent1402 < Base
  def solve
    mi = MaskedInterpreter2.new(input)
    mi.run
    mi.memsums
  end

  def input_style
    :raw
  end
end

# Solve 1402
#
class MaskedInterpreter2
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
    addr = expand_floats([masked_num(@mask, matches[1])]).map { |a| a.to_i(2) }
    addr.each { |a| @mem[a] = matches[2].to_i }
  end

  def update_mask(line)
    @mask = line.split.last
  end

  def expand_floats(bits)
    new = bits.map { |b| [b.sub('X', '0'), b.sub('X', '1')] }.flatten
    return new unless new.first.include?('X')

    expand_floats(new)
  end

  def masked_num(mask, num)
    full_bin(num).each_char.with_index.with_object([]) do |(c, i), s|
      s << case mask[i]
           when '0'
             c
           when '1'
             1
           else
             'X'
           end
    end.join
  end

  def full_bin(num)
    format('%036d', num.to_i.to_s(2))
  end
end
