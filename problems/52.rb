require './problem_interface.rb'

class Problem52 < ProblemBase
  def solve
    n = 1
    while true
      return n if multiples_same_digits(n, 6)
      n += 1
    end
  end
end

def multiples_same_digits(n, multiplier)
  n_digits = n.to_s.chars.sort
  (2..multiplier).each do |m|
    return false if (m * n).to_s.chars.sort != n_digits
  end
  true
end