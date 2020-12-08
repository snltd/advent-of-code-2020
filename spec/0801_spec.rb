#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative 'spec_helper'
require_relative '../lib/0801'

# Problem 0801
#
class ProblemTest0801 < MiniTest::Test
  include SpecHelper

  # This will test the "real" public interface of Assember::Runtime
  def sample_answer
    5
  end
end
