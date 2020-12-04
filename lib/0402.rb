# frozen_string_literal: true

require_relative 'support/base'

# Problem 0402
#
class Advent0402 < Base
  def solve
    input.count { |passport| valid?(passport) }
  end

  def valid?(passport)
    Passport.new(passport).valid?
  end

  def input_style
    :as_chunks
  end
end

# Breaks a passport string up into a hash, and provides methods to validate
# each field
#
class Passport
  attr_reader :passport

  def initialize(passport)
    @passport = hashified(passport)
  end

  def hashified(passport)
    passport.split(/\s+/).map { |field| field.split(':') }.to_h
  end

  def valid?
    required_fields.all? do |field|
      send("valid_#{field}?", passport[field]) if passport.key?(field)
    end
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

  def valid_byr?(val)
    val.to_i.between?(1920, 2002)
  end

  def valid_iyr?(val)
    val.to_i.between?(2010, 2020)
  end

  def valid_eyr?(val)
    val.to_i.between?(2020, 2030)
  end

  def valid_hgt?(val)
    if val.end_with?('cm')
      val.to_i.between?(150, 193)
    elsif val.end_with?('in')
      val.to_i.between?(59, 76)
    end
  end

  def valid_hcl?(val)
    val.match?(/^#[0-9a-f]{6}$/)
  end

  def valid_pid?(val)
    val.match?(/^[0-9]{9}$/)
  end

  def valid_ecl?(val)
    %w[amb blu brn gry grn hzl oth].include?(val)
  end
end
