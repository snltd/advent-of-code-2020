#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative 'spec_helper'
require_relative '../lib/0402'

# Problem 0402. They don't give us a sample answer, just lots of little
# examples, so the standard test we've used so far isn't a good fit.
#
class ProblemTest0402 < MiniTest::Test
  attr_reader :c

  def setup
    @c = Advent0402.new
  end

  def test_valid?
    refute c.valid?("eyr:1972 cid:100\n" \
                    'hcl:#18171d ecl:amb hgt:170 pid:186cm iyr:2018 byr:1926')

    refute c.valid?("iyr:2019\n" \
                    "hcl:#602927 eyr:1967 hgt:170cm\n" \
                    'ecl:grn pid:012533040 byr:1946')

    refute c.valid?("hcl:dab227 iyr:2012\n" \
                    'ecl:brn hgt:182cm pid:021572410 eyr:2020 byr:1992 cid:277')

    refute c.valid?("hgt:59cm ecl:zzz\n" \
                    "eyr:2038 hcl:74454a iyr:2023\n" \
                    'pid:3556412378 byr:2007')

    assert c.valid?('pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 ' \
                    "byr:1980\n" \
                    'hcl:#623a2f')

    assert c.valid?("eyr:2029 ecl:blu cid:129 byr:1989\n" \
                    'iyr:2014 pid:896056539 hcl:#a97842 hgt:165cm')

    assert c.valid?("hcl:#888785\n" \
                    "hgt:164cm byr:2001 iyr:2015 cid:88\n" \
                    "pid:545766238 ecl:hzl\n" \
                    'eyr:2022')

    assert c.valid?('iyr:2010 hgt:158cm hcl:#b6652a ecl:blu byr:1944 ' \
                    'eyr:2021 pid:093154719')
  end
end

# Unnecessary because we test the interface above, but these were written
# first, to build the thing tested above. Might as well leave them in.
#
class PassportTest < MiniTest::Test
  attr_reader :c

  def setup
    @c = Passport.new(sample_data)
  end

  def test_valid_byr?
    assert c.valid_byr?(2002)
    refute c.valid_byr?(2003)
  end

  def test_valid_hgt?
    assert c.valid_hgt?('60in')
    assert c.valid_hgt?('190cm')
    refute c.valid_hgt?('190in')
    refute c.valid_hgt?('190')
  end

  def test_valid_hcl?
    assert c.valid_hcl?('#123abc')
    refute c.valid_hcl?('#123abz')
    refute c.valid_hcl?('123abc')
  end

  def test_valid_ecl?
    assert c.valid_ecl?('brn')
    refute c.valid_ecl?('wat')
  end

  def test_valid_pid?
    assert c.valid_pid?('000000001')
    refute c.valid_pid?('0123456789')
  end

  private

  def sample_data
    'pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980 hcl:#623a2f'
  end
end
