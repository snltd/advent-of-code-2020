# frozen_string_literal: true

# Used on Day 3
#
class Toboggan
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def run(move)
    g = Grid.new(input, move: move)
    hits = 0

    loop do
      hits += 1 if g.hit?
      g.move!
    end
  rescue OutsideGridY
    hits
  end
end
