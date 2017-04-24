require "./problem_interface.rb"

def sum_of_squares(range)
    acc = 0
    for i in range
        acc += i * i
    end
    return acc
end

class Problem6 < ProblemBase
    def solve
        range = 1..100
        return range.inject(:+)**2 - sum_of_squares(range)
    end
end