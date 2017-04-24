require "./problem_interface.rb"

def is_prime(known_primes, n)
    sq_root = Math.sqrt(n)
    known_primes.each do |f|
        if f > sq_root
            break
        end

        if n % f == 0
            return false
        end
    end
    return true
end

def next_prime(known_primes, f)
    new_prime = f + 1
    while is_prime(known_primes, new_prime) == false
        new_prime = new_prime + 1
    end
    known_primes.push(new_prime)
    return new_prime
end

def nth_prime(n)
    if n == 1
        return 2
    end

    known_primes = [2]
    for x in 2..n
        next_prime(known_primes, known_primes[known_primes.length - 1])
    end
    return known_primes[known_primes.length - 1]
end

class Problem7 < ProblemBase
    def solve
        nth_prime(10001)
    end
end