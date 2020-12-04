#!/usr/bin/env ruby

# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/support/runner'

# Record the answers here for a double-check that we haven't had a regression
# if we change any of the support classes.

ANSWERS = {
  '0101': 1016619,
  '0102': 218767230,
  '0201': 614,
  '0202': 354,
  '0301': 265,
  '0302': 3154761400,
  '0401': 245,
  '0402': 133,
  '0501': nil,
  '0502': nil,
  '0601': nil,
  '0602': nil,
  '0701': nil,
  '0702': nil,
  '0801': nil,
  '0802': nil,
  '0901': nil,
  '0902': nil,
  '1001': nil,
  '1002': nil,
  '1101': nil,
  '1102': nil,
  '1201': nil,
  '1202': nil,
  '1301': nil,
  '1302': nil,
  '1401': nil,
  '1402': nil,
  '1501': nil,
  '1502': nil,
  '1601': nil,
  '1602': nil,
  '1701': nil,
  '1702': nil,
  '1801': nil,
  '1802': nil,
  '1902': nil,
  '1901': nil,
  '2001': nil,
  '2002': nil,
  '2101': nil,
  '2102': nil,
  '2201': nil,
  '2202': nil,
  '2301': nil,
  '2302': nil,
  '2401': nil,
  '2402': nil
}.freeze

class ProblemTest0000 < MiniTest::Test
  def test_answers
    ANSWERS.compact.each do |problem, answer|
      assert_equal answer, Runner.new(problem).solution
    end
  end
end
