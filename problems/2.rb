require './problem_interface.rb'

def fibonacci_even_sum(acc, previous_two_fibb, limit)
    next_fibb = previous_two_fibb[0] + previous_two_fibb[1]
    if next_fibb > limit
        return acc
    end

    if next_fibb % 2 == 0
        acc = acc + next_fibb
    end

    return fibonacci_even_sum(acc, [previous_two_fibb[1], next_fibb], limit)
end

class Problem2 < ProblemBase
    def solve
        fibonacci_even_sum(0, [1, 1], 4000000)
    end
end