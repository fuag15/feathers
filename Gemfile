source 'https://rubygems.org' # standard community source host

gem 'rails', '3.2.13' # hardset rails version

gem 'pg', '~> 0.14.1' # postgres gem for db backend
gem 'jquery-rails', '~> 2.2.1' # jquery in asset pipe
gem 'haml-rails', '~> 0.4' # haml interpretation
gem 'unicorn', '~> 4.6.2' # alternative quick C based webserver
gem 'carrierwave', '~> 0.8.0' # image and file uploading
gem 'mini_magick', '~> 3.6.0' # image manipulation library
gem 'devise', '~> 2.2.3' # user management
gem 'cancan', '~> 1.6.9' # route access control
gem 'foreman', '~> 0.62.0' # manage start commend for heroku
gem 'term-ansicolor', '~> 1.1.1' # dependency of analyzer rake task
gem 'flog', '~> 3.2.2' # how complex is our code
gem 'flay', '~> 2.1.0' # how much does our code repeat itself
gem 'rails_best_practices', '~> 1.13.4' # how close are we to standards
gem 'reek', '~> 1.3.1' # how smelly are we
gem 'redcarpet', '~> 2.2.2' # markdown parsing
gem 'kaminari', '~> 0.14.1' # pagination
gem 'bootstrap-kaminari-views', '~> 0.0.2' # bootstrap compatable kaminari templates

group :assets do
  gem 'sass-rails', '~> 3.2.3' # sass interpretation
  gem 'bootstrap-sass', '~> 2.3.0.1' # twitter bootstrap
  gem 'coffee-rails', '~> 3.2.1' # coffee asset pipe support
  gem 'bourbon', '~> 3.1.6' # better sass modernization mixins
  gem 'neat', '~> 1.3.0' # better mixin than bootstrap
  gem 'therubyracer', '~> 0.11.4', platforms: :ruby # javascript runtime in ruby
  gem 'uglifier', '>= 1.0.3' # asset minification
end

group :test, :development do
  gem 'simplecov', '~> 0.7.1' # code coverage
  gem 'roodi', '~> 2.1.0' # cyclomatic complexity
  gem 'awesome_print', '~> 1.1.0' # better irb printing
  gem 'cheat', '~> 1.3.3' # quick spec lookup
  gem 'forgery', '~> 0.5.0' # fake string values randomly with order!
  gem 'debugger', '~> 1.5.0' # ruby debugg generalist tool
  gem 'pry', '~> 0.9.12' # ruby runtime introspection
  gem 'pry-remote', '~> 0.1.7' # pry for remote processes
  gem 'rspec-rails', '~> 2.13.0' # unit tests for models / routes
  gem 'factory_girl_rails', '~> 4.2.1' # model factories
  gem 'capybara-webkit', '~> 0.14.2' # headless browser tests
  gem 'launchy', '~> 2.2.0' # auto launch web page for capybara tests
  gem 'database_cleaner', '~> 0.9.1' # clean out databases between tests
  gem 'headless', '~> 1.0.1' # headless webkit driver runs on hidden xvfb device
  gem 'ruby-fsevent', '~> 0.2.1' # detect fs event changes for gaurd
  gem 'guard-rspec', '~> 3.0.1' # watch for file system changes and run relevant tests
  gem 'parallel_tests', '~> 0.13.3' # run rspec tests in parallel
  gem 'zeus-parallel_tests', '~> 0.2.4' # run parallel tests off of zeus env
  gem 'zeus', '~> 0.13.3' # preload the rails envs for testing
end
