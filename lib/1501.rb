# frozen_string_literal: true

require_relative 'support/base'

# Problem 1501
#
class Advent1501 < Base
  def solve
    solve_for(input.first.split(',').map(&:to_i), 2020)
  end

  def solve_for(list, stop_at)
    return list.last if list.size == stop_at

    last = list.pop # modifies list!
    new = list.include?(last) ? list.size - list.rindex(last) : 0

    solve_for(list.append(last, new), stop_at)
  end

  def input_style
    :as_lines
  end
end
