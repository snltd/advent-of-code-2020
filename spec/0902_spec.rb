#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative 'spec_helper'

# Problem 0902
#
class TestAdvent0902 < MiniTest::Test
  include SpecHelper

  def sample_answer
    62
  end

  def post_setup
    c.target = 127
  end
end
