require './problem_interface.rb'

class Problem92 < ProblemBase
  def solve
    digits = (0..9).to_a

    total = 0
    digits.repeated_combination(7).each do |combination|
      as_int = combination.join.to_s.to_i
      next if as_int == 0
      if digit_square_sum_chain_end(as_int) == 89
        total += num_permutations combination
      end
    end
    total
  end
end

def digit_square_sum_chain_end(start)
  n = start
  while n != 1 && n != 89
    n = digit_square_sum n
  end
  n
end

def digit_square_sum(n)
  sum = 0
  while n > 0
    digit = n % 10
    sum += digit * digit
    n = n / 10
  end
  sum
end

def num_permutations(elements)
  element_count = elements.each_with_object(Hash.new(0)) {|e, h| h[e] += 1}
  factorial(elements.length) / element_count.reduce(1) {|acc, e| acc * factorial(e[1])}
end

def factorial(n)
  return 1 if n == 0
  n * factorial(n - 1)
end