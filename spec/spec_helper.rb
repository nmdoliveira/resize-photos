if ENV["COVERAGE"]
  require "simplecov"

  SimpleCov.start :rails do
    add_filter do |source_file|
      open(source_file.filename).grep(/:nocov:/).any?
    end

    %w(Representers).each do |group|
      add_group group do |source_file|
        source_file.filename =~ /#{group.downcase}/
      end
    end

    groups.delete "Mailers"
    groups.delete "Libraries"
  end
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.example_status_persistence_file_path = "spec/examples.txt"

  config.disable_monkey_patching!

  if config.files_to_run.one?
    config.default_formatter = "doc"
  end

  config.order = :random

  Kernel.srand config.seed
end
