require "./problem_interface.rb"

# Formula for b found via this system of equations:
#   a^2 + b^2 = c^2
#   a + b + c = n
def find_pythagorean_triplet(n)
    for a in 1..n
        b = ((2 * a * n) - (n * n)) / (2 * a - 2 * n).to_f
        if (b < 0 || b.infinite? || !b.floor.to_f.eql?(b))
            next
        end

        c = n - a - b
        if (c < 0)
            next
        end

        return (a * b * c).to_i
    end

    0
end

class Problem9 < ProblemBase
    def solve
        find_pythagorean_triplet(1000)
    end
end