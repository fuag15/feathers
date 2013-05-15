require 'rubygems'
require 'term/ansicolor'
require 'reek/rake/task'

Reek::Rake::Task.new do |t|
  t.source_files = 'app'
  t.verbose = false
  t.fail_on_error = false
end

namespace :analyzer do
  desc 'run all code analyzing tools (reek, rails_best_practices, flog, flay, roodi)'
  task all: [:reek, :rails_best_practices, :flog, :flay, :roodi] do
    message :info, 'all code analyzing tools ran'
  end

  desc 'run reek and find code smells'
  task :reek do
    message :info, 'Running reek and find code smells'
    Rake::Task['reek'].invoke
  end

  desc 'run rails_best_practices and inform about found issues'
  task :rails_best_practices do
    message :info, 'Running rails_best_practices and inform about found issues'
    puts `rails_best_practices`
  end

  desc 'run flog and find the most tortured code'
  task :flog do
    message :info, 'Running flog and find the most tortured code'
    sh 'flog -cad app/models/*.rb'
  end

  desc 'run flay and analyze code for structural similarities'
  task :flay do
    message :info, 'Running flay and analyzing code for structural similarities'
    sh 'flay app/*'
  end

  desc 'run roodi and analyze all app code for cyclomatic complexity'
  task :roodi do
    message :info, 'Running roodi and analyzing code for cyclomatic complexity'
    sh 'roodi -config=config/roodi.yml ./app/**/*.rb'
  end
end

def message type, message
  set_color type
  puts message
  reset_color
end

def set_color type
  term = Term::ANSIColor
  colors = { info: term.green, error: term.red }
  puts colors[type]
end

def reset_color
  puts Term::ANSIColor.reset
end