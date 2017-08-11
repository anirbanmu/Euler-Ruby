require './problem_interface.rb'

class Problem14 < ProblemBase
  def solve
    cache = Array.new(1000000)
    result = (2..1000000 - 1).reduce([0, 0]) {|acc, n| l = collatz_chain_length(cache, n, n); l > acc[0] ? [l, n] : acc}
    result[1]
  end
end

def collatz_chain_length(cache, start, cache_populated_under)
  return cache[1] = 1 if start == 1
  return cache[start] if cache[start]

  n = start
  i = 1
  while n != 1 && n >= cache_populated_under
    n = next_collatz n
    i += 1
  end

  cache[start] = n == 1 ? i : i + cache[n]
end

def next_collatz(n)
  return n / 2 if n % 2 == 0
  3 * n + 1
end