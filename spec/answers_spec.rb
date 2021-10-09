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
  '0501': 880,
  '0502': 731,
  '0601': 7120,
  '0602': 3570,
  '0701': 124,
  '0702': 34862,
  '0801': 2003,
  '0802': 1984,
  '0901': 14360655,
  '0902': 1962331,
  '1001': 2176,
  '1002': 18512297918464,
  '1101': 2275,
  '1102': 2121,
  '1201': 1441,
  '1202': 61616,
  '1301': 6568,
  '1302': nil,
  '1401': 17934269678453,
  '1402': 3440662844064,
  '1501': 1085,
  '1502': 10652,
  '1601': 27802,
  '1602': nil,
  '1701': nil,
  '1702': nil,
  '1801': 4940631886147,
  '1802': 283582817678281,
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

class TestAllAnswers < MiniTest::Test
  def test_answers
    ANSWERS.compact.each do |problem, answer|
      assert_equal answer, Runner.new(problem).solution
    end
  end
end
