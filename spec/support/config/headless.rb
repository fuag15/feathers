RSpec.configure do |config|
  # if its webkit lets make it headless
  config.before do
    if Capybara.current_driver == :webkit
      @headless = Headless.new
      @headless.start
    end
  end

  # destroy headless after
  config.after do
    if Capybara.current_driver == :webkit
      @headless.destroy
    end
  end
end