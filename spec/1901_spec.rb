#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative 'spec_helper'

# Problem 1901
#
class TestAdvent1901 < MiniTest::Test
  include SpecHelper

  def test_separate_input
    rule_list, messages = c.separate_input

    assert_instance_of(Array, rule_list)
    assert_equal(6, rule_list.size)
    assert_equal('4 4 | 5 5', rule_list[2])
    assert_equal('b', rule_list[5])

    assert_instance_of(Array, messages)
    assert_equal(5, messages.size)
    assert_equal('aaabbb', messages[3])
  end

  def test_regex
    rule_list, _messages = c.separate_input
    r = c.regex(rule_list)

    assert_match(r, 'ababbb')
    refute_match(r, 'bababa')
    assert_match(r, 'abbbab')
    refute_match(r, 'aaabbb')
    refute_match(r, 'aaaabbb')
  end

  def sample_answer
    2
  end
end
