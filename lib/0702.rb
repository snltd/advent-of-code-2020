# frozen_string_literal: true

require_relative '0701'

# Problem 0702
#
class Advent0702 < Advent0701
  def solve
    set_up_data_stores

    expand(wanted).size - 1
  end

  def expand(bag)
    aggr = [bag]

    return aggr unless @bag_map.key?(bag)

    bag_map[bag].each do |colour, how_many|
      how_many.times { aggr += expand(colour) }
    end

    aggr
  end
end
