source "https://rubygems.org"

gem "rails", "~> 5.1.1"

gem "mongoid"
gem "puma", "~> 3.7"

gem "responders"
gem "roar-rails"
gem "dragonfly"
gem "dragonfly-mongoid_data_store", require: "dragonfly/mongoid_data_store"
gem "rest-client"
gem "dotenv-rails"

group :development, :test do
  gem "byebug"
end

group :development do
  gem "listen"
  gem "rubocop"
end

group :test do
  gem "rspec-rails"
  gem "simplecov", require: false
  gem "factory_girl_rails"
  gem "database_cleaner"
  gem "webmock"
  gem "stub_env"
end

group :production do
  gem "rack-cache", require: "rack/cache"
end
