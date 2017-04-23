require "./problem_interface.rb"

def divisible_by_all(divisors, n)
    divisors.each do |x|
        if n % x != 0
            return false
        end
    end
    return true
end

def is_prime(n)
    for f in 2..n-1
        if n % f == 0
            return false
        end
    end
    return true
end

def find_lowest_div_by_all(range)
    divisors = []

    increment = 1
    for i in range[0]..range[1]
        if is_prime(i)
            increment *= i
        else
            divisors.push(i)
        end
    end

    n = increment
    while true
        if divisible_by_all(divisors, n)
            return n
        end
        n += increment
    end
end

class Problem5 < ProblemBase
    def solve
        find_lowest_div_by_all([1, 20])
    end
end