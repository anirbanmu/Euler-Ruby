require './problem_interface.rb'

class Problem55 < ProblemBase
  def solve
    (1..10000 - 1).reduce(0) {|acc, n| is_lychrel(n) ? acc + 1 : acc}
  end
end

def is_lychrel(n)
  50.times do
    n = n + n.to_s.reverse.to_i
    return false if is_palindrome n.to_s
  end
  true
end

def is_palindrome(s)
  s == s.reverse
end