require './problem_interface.rb'

class Problem25 < ProblemBase
  def solve
    find_first_fibonacci 1000
  end
end

def find_first_fibonacci(digits)
  upper = fibonacci_upper_bound_index digits
  lower = 1
  while lower < upper
    center = (lower + upper) / 2
    center_digits = fibonacci_digits(center)
    if center_digits < digits
      lower = center + 1
      next
    end
    upper = center
  end
  lower
end

def fibonacci_upper_bound_index(digits)
  upper_bound = 1
  while fibonacci_digits(upper_bound) < digits
    upper_bound *= 2
  end
  upper_bound
end

# Number of digits in nth fibonnaci number (approximate: elimiated second numerator term since it tends to 0)
def fibonacci_digits(n)
  (n * Math.log10(1 + Math.sqrt(5)) - n * Math.log10(2) - Math.log10(Math.sqrt(5))).to_i + 1
end