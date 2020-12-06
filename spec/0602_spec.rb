#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative 'spec_helper'

# Problem 0602
#
class ProblemTest0602 < MiniTest::Test
  include SpecHelper

  def sample_answer
    6
  end

  def test_all_answers
    assert_equal(%w[a b c], c.all_answers("a\nab\nac"))
  end

  def _test_unanimous_yeses
    assert_equal(3, c.unanimous_yeses('abc'))
    assert_equal(0, c.unanimous_yeses("a\nb\nc"))
    assert_equal(1, c.unanimous_yeses("ab\nac"))
    assert_equal(1, c.unanimous_yeses("a\na\na\na"))
    assert_equal(1, c.unanimous_yeses('b'))
  end
end
