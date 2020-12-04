# frozen_string_literal: true

require_relative 'support/base'

# Problem 0401
#
class Advent0401 < Base
  def solve
    input.count { |passport| check(passport) }
  end

  def required_fields
    ['byr', # (Birth Year)
     'iyr', # (Issue Year)
     'eyr', # (Expiration Year)
     'hgt', # (Height)
     'hcl', # (Hair Color)
     'ecl', # (Eye Color)
     'pid'] # (Passport ID)
  end

  def check(passport)
    required_fields?(passport)
  end

  def required_fields?(passport)
    (required_fields - hashified(passport).keys).empty?
  end

  def hashified(passport)
    passport.split(/\s+/).map { |field| field.split(':') }.to_h
  end

  def input_style
    :as_chunks
  end
end
