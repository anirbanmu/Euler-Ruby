require './problem_interface.rb'

class Problem36 < ProblemBase
  def solve
    sum_double_base_palindromes(1000000)
  end
end

def sum_double_base_palindromes(limit)
  (1..limit - 1).reduce(0) {|acc, n| is_palindrome(10, n) && is_palindrome(2, n) ? acc + n : acc}
end

def is_palindrome(base, n)
  n_str = n.to_s(base)
  n_str == n_str.reverse
end