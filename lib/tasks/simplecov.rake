namespace :spec do
  desc 'Create rspec coverage'
  task :coverage do
    ENV['COVERAGE'] = 'true'
    Rake::Task['spec'].execute
  end

  desc 'View Coverage Reports'
  task :view do
    sh 'launchy coverage/index.html'
  end
end