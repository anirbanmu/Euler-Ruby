#!/usr/bin/env ruby

require 'benchmark'

class TimedProblemSolution
    attr_accessor :idx, :result, :time

    def initialize(idx, result, time)
        @idx = idx
        @result = result
        @time = time
    end
end

def time_problem_solve(idx, problem)
    result = nil
    realtime = Benchmark.realtime { result = problem.solve }
    return TimedProblemSolution.new(idx, result, realtime * 1000 * 1000)
end

def run_euler_problems()
    problems = []
    Dir["./problems/*.rb"].each do |problem_file|
        require problem_file
        problem_number = File.basename(problem_file, '.rb')
        problems.push(time_problem_solve(problem_number.to_i, Object.const_get('Problem' + problem_number).new))
    end

    problems.sort! {|a, b| a.idx <=> b.idx}

    problems.each do |p|
        puts 'Problem ' + p.idx.to_s + ': ' + p.result.to_s + " ( " + p.time.to_s + " μs )"
    end
end

run_euler_problems()