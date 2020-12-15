#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative 'spec_helper'
require_relative '../lib/1502'

# Problem 1502
#
class TestAdvent1502 < MiniTest::Test
  include SpecHelper

  def sample_answer
    175594
  end

  def test_setup_memo
    assert_equal({ '0' => 1,
                   '3' => 2 },
                 c.setup_memo(%w[0 3 6]))
  end

  def test_solve_for
    assert_equal(1, c.solve_for('1,3,2', 2020))
    assert_equal(10, c.solve_for('2,1,3', 2020))
    assert_equal(27, c.solve_for('1,2,3', 2020))
    assert_equal(78, c.solve_for('2,3,1', 2020))
    assert_equal(438, c.solve_for('3,2,1', 2020))
    assert_equal(1836, c.solve_for('3,1,2', 2020))

    assert_equal(1085, c.solve_for('1,20,11,6,12,0', 2020))

    assert_equal(175594, c.solve_for('0,3,6', 30000000))
  end
end
