require "spec_helper"

ENV["RAILS_ENV"] ||= "test"

require File.expand_path("../../config/environment", __FILE__)

if Rails.env.production?
  abort "The Rails environment is running in production mode!"
end

require "rspec/rails"

require "webmock/rspec"

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

  config.include FactoryGirl::Syntax::Methods
  config.include RequestMethods, type: :request
  config.include JSONMethods, type: :representer
  config.include StubEnv::Helpers
end
