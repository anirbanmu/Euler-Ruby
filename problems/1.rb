require './problem_interface.rb'

class Problem1 < ProblemBase
    def solve
        @result = 1
        return solve1
    end

    def solve1
        return @result
    end
end