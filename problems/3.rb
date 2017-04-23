require './problem_interface.rb'

def is_prime(n)
    for f in 2..n-1
        if n % f == 0
            return false
        end
    end
    return true
end

def next_prime(f)
    new_f = f + 1
    while is_prime(new_f) == false
        new_f = new_f + 1
    end
    return new_f
end

def largest_prime_factor(n)
    if n == 1
        return 1
    end

    factor = 2
    while n > 1
        if n % factor == 0
            n = n / factor
            next
        end

        factor = next_prime(factor)
    end
    return factor
end

class Problem3 < ProblemBase
    def solve
        largest_prime_factor(600851475143)
    end
end