RSpec.configure do |config|
  # we know jquery, we should use jquery
  Capybara.default_selector = :css
  # for javascript tests use webkit driver
  Capybara.javascript_driver = :webkit
end