require './problem_interface.rb'

def sum_primes(limit)
    if limit <= 2
        0
    end

    arr = Array.new(limit, true)

    arr[0] = arr[1] = false
    for i in 2 .. Math.sqrt(limit)
        if !arr[i]
            next
        end

        for j in (i * i .. arr.length - 1).step(i)
            arr[j] = false
        end
    end

    sum = 0
    arr.each_with_index do |n, index|
        if n
            sum += index
        end
    end

    return sum
end

class Problem10 < ProblemBase
    def solve
        sum_primes(2000000)
    end
end