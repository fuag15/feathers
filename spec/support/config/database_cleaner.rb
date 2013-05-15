RSpec.configure do |config|
  # transactional cleaning to work with selenium
  config.before :suite do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation
  end

  # clean databases
  config.before do
    DatabaseCleaner.start
  end

  # more cleaning
  config.after do
    DatabaseCleaner.clean
  end

  # clean out uploaded files
  config.after :all do
    FileUtils.rm_rf Dir["#{Rails.root}/spec/support/uploads"]
  end 
end