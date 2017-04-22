#!/usr/bin/env ruby

def run_euler_problems()
    Dir["./problems/*.rb"].each do |problem_file|
        require problem_file
        problem_number = File.basename(problem_file, '.rb')
        problem_class_name = Object.const_get('Problem' + problem_number)
        problem = problem_class_name.new
        puts 'Problem ' + problem_number + ": " + problem.solve.to_s
    end
end

run_euler_problems()