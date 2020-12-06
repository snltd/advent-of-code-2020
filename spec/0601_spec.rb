#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative 'spec_helper'

# Problem 0601
#
class ProblemTest0601 < MiniTest::Test
  include SpecHelper

  def sample_answer
    11
  end

  def test_yeses
    assert_equal(3, c.yeses('abc'))
    assert_equal(3, c.yeses("a\nb\nc"))
    assert_equal(3, c.yeses("ab\nac"))
    assert_equal(1, c.yeses("a\na\na\na"))
    assert_equal(1, c.yeses('b'))
  end
end
