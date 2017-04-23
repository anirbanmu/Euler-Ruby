require "./problem_interface.rb"

def is_palindrome(n)
    s = n.to_s

    for i in 0..(s.length / 2) - 1
        if s[i] != s[s.length - 1 - i]
            return false
        end
    end

    return true
end

# Search diagonal by diagonal (starting at middle and going to x - 1, y + 1 and so on) of bottom portion of multiplication table such that higher products are always encountered first.
# First palindrome found is the highest possible one; no need to look further.
def find_largest_palindrome(digits)
    limit = 10 ** digits

    last_diag_start = [limit - 1, limit - 1]
    position = [limit - 1, limit - 1]

    while position[0] > 0 and position[1] > 0
        product = position[0] * position[1]
        if is_palindrome(product)
            return product
        end

        if position[0] - 1 == 0 or position[1] + 1 == limit
            if position[0] == position[1]
                position[0] = last_diag_start[0] = last_diag_start[0] - 1
                position[1] = last_diag_start[1]
            else
                position[0] = last_diag_start[0]
                position[1] = last_diag_start[1] = last_diag_start[1] - 1
            end
            next
        end

        position[0] -= 1
        position[1] += 1
    end

    return -1
end

class Problem4 < ProblemBase
    def solve
        find_largest_palindrome(3)
    end
end