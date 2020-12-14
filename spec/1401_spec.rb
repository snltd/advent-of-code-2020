#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative 'spec_helper'
require_relative '../lib/1401'

# Problem 1401
#
class TestAdvent1401 < MiniTest::Test
  include SpecHelper

  def sample_answer
    165
  end
end

class TestMaskedInterpreter < MiniTest::Test
  attr_reader :c

  def setup
    @c = MaskedInterpreter.new
  end

  def test_masked_num
    mask = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXX1XXXX0X'

    assert_equal('000000000000000000000000000001001001',
                 c.masked_num(mask, 11))

    assert_equal('000000000000000000000000000001100101',
                 c.masked_num(mask, 101))

    assert_equal('000000000000000000000000000001000000',
                 c.masked_num(mask, 64))
  end

  def test_full_bin
    assert_equal('000000000000000000000000000000001011', c.full_bin(11))
    assert_equal('000000000000000000000000000001100101', c.full_bin(101))
    assert_equal('000000000000000000000000000001000000', c.full_bin(64))
  end
end
