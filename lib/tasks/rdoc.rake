#clear the doc:app task et al
Rake::Task['doc:app'].clear
Rake::Task['doc/app'].clear
Rake::Task['doc/app/index.html'].clear

# generate saner doc
namespace :doc do
  desc 'Generate documentation for the application.'
  Rake::RDocTask.new :app do |rdoc|
    rdoc.rdoc_dir = 'doc/app'
    rdoc.title = 'Midgard Productions RDoc'
    rdoc.rdoc_files.include 'app/**/*.rb', 'lib/**/*.rb', 'doc/README.rdoc'
    rdoc.main = 'doc/README.rdoc'
  end

  desc 'Load a browser of the rdoc'
  task :view do
    sh 'launchy doc/app/index.html'
  end
end