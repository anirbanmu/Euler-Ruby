require './problem_interface.rb'

def accumulate_multiples(limit, factor, ignore_factor = nil)
    sum = 0
    n = factor
    while n < limit
        if ignore_factor == nil or n % ignore_factor != 0
            sum += n
        end
        n += factor
    end
    return sum
end

class Problem1 < ProblemBase
    def solve
        accumulate_multiples(1000, 3) + accumulate_multiples(1000, 5, 3)
    end
end