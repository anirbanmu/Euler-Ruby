require './problem_interface.rb'

class Problem15 < ProblemBase
  def solve
    calculate_lattice_path_count(20, {}, 0, 0)
  end
end

def calculate_lattice_path_count(n, cache, x, y)
  return 1 if x == n && y == n

  return cache[[x, y]] if cache[[x, y]]

  path_count = 0
  path_count += calculate_lattice_path_count(n, cache, x + 1, y) if x + 1 <= n
  path_count += calculate_lattice_path_count(n, cache, x, y + 1) if y + 1 <= n
  cache[[x, y]] = path_count
end