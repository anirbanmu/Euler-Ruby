require './problem_interface.rb'

class Problem24 < ProblemBase
  def solve
    nth_permutation('', (0..9).to_a, 1000000)
  end
end

# We can use the number of n - 1 permutations possible to figure out which choice to take for this call since they are ordered.
def nth_permutation(accumulated, choices, n)
  return accumulated if choices.empty?
  #return accumulated + choices[0].to_s if n == 0

  sub_permutations = factorial(choices.length - 1)
  choice_partition = (n - 1) / sub_permutations
  nth_permutation(accumulated + (choices.delete_at(choice_partition)).to_s, choices, n - choice_partition * sub_permutations)
end

def factorial(n)
  return 1 if n == 0
  n * factorial(n - 1)
end