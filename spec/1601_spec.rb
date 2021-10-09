#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative 'spec_helper'

# Problem 1601
#
class TestAdvent1601 < MiniTest::Test
  include SpecHelper

  def sample_answer
    71
  end

  def test_parse_rules
    assert_equal({ 'class' => [1, 2, 3, 5, 6, 7],
                   'row' => [4, 5, 8, 9] },
                 c.parse_rules("class: 1-3 or 5-7\nrow: 4-5 or 8-9"))
  end

  def test_parse_rule
    assert_equal([1, 2, 3, 4, 8, 9, 10], c.parse_rule('1-4 or 8-10'))
  end
end
