#!/usr/bin/env ruby

require 'benchmark'
require 'matrix'

def run_euler_problems()
  problems = []
  Dir["./problems/*.rb"].each do |problem_file|
    require problem_file
    problem_number = File.basename(problem_file, '.rb')
    problems.push(time_problem_solve(problem_number.to_i, Object.const_get('Problem' + problem_number).new))
  end

  problems.sort! {|a, b| a[0] <=> b[0]}

  problems.unshift ['-------', '------', '-----------------']
  problems.unshift ['Problem', 'Result', 'Time elapsed (μs)']

  pretty_print_table problems
  return

  problems.each do |p|
    puts 'Problem ' + p[0].to_s + ': ' + p[1].to_s + " ( " + p[2].to_s + " μs )"
  end
end

def time_problem_solve(idx, problem)
  result = nil
  realtime = Benchmark.realtime { result = problem.solve }
  return [idx, result, (realtime * 1000 * 1000).round(4)]
end

def pretty_print_table(arr)
  return if arr.length < 1

  matrix = Matrix[*arr.map {|r| r.map {|c| c.to_s}}]

  col_widths = matrix.column_vectors.map {|col| col.reduce(0) {|max, e| max > e.length ? max : e.length}}

  matrix.row_vectors.each do |row|
    row_str = ''
    row.each_with_index {|e, i| row_str = row_str + ' ' * (4 + col_widths[i] - e.length) + e}
    puts row_str
  end
end


run_euler_problems()