RSpec.configure do |config|
  config.raise_errors_for_deprecations!
end

ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
#require 'rspec/autorun'
require 'database_cleaner'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
  config.include FactoryGirl::Syntax::Methods
  config.infer_base_class_for_anonymous_controllers = false
  #config.raise_errors_for_deprecations!

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.clean
  end

  config.order = "random"
  config.infer_spec_type_from_file_location!

  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end

  config.mock_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end