#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative 'spec_helper'

# Problem 0401
#
class ProblemTest0401 < MiniTest::Test
  include SpecHelper

  def sample_answer
    2
  end

  def test_check_passport
    assert c.check("ecl:gry pid:860033327 eyr:2020 hcl:#fffffd\n" \
                   'byr:1937 iyr:2017 cid:147 hgt:183cm')

    refute c.check("iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884\n" \
                   'hcl:#cfa07d byr:1929')

    assert c.check("hcl:#ae17e1 iyr:2013\n" \
                   "eyr:2024\n" \
                   "ecl:brn pid:760753108 byr:1931\n" \
                   'hgt:179cm')

    refute c.check("hcl:#cfa07d eyr:2025 pid:166559648\n" \
                   'iyr:2011 ecl:brn hgt:59in')
  end
end
