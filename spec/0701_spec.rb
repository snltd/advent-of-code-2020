#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative 'spec_helper'

# Problem 0701
#
class ProblemTest0701 < MiniTest::Test
  include SpecHelper

  def sample_answer
    4
  end

  def test_process_bag
    assert_equal(
      ['light red', { 'bright white' => 1, 'muted yellow' => 2 }],
      c.process_bag(
        'light red bags contain 1 bright white bag, 2 muted yellow bags.'
      )
    )
  end
end
