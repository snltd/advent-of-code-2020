#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative 'spec_helper'
require_relative '../lib/1402'

# Problem 1402
#
class TestAdvent1402 < MiniTest::Test
  include SpecHelper

  def sample_answer
    208
  end
end

class TestMaskedInterpreter2 < MiniTest::Test
  attr_reader :c

  def setup
    @c = MaskedInterpreter2.new
  end

  def test_masked_num
    mask = '000000000000000000000000000000X1001X'

    assert_equal('000000000000000000000000000000X1101X',
                 c.masked_num(mask, 42))
  end

  def test_expand_floats
    assert_equal(%w[000000000000000000000000000000011010
                    000000000000000000000000000000011011
                    000000000000000000000000000000111010
                    000000000000000000000000000000111011],
                 c.expand_floats(['000000000000000000000000000000X1101X']))
  end

  def test_full_bin
    assert_equal('000000000000000000000000000000101010', c.full_bin(42))
    assert_equal('000000000000000000000000000000011010', c.full_bin(26))
    assert_equal('000000000000000000000000000000011011', c.full_bin(27))
  end
end
