if Rails.env.development?
  require "rspec/core/rake_task"
  require "rubocop/rake_task"

  RSpec::Core::RakeTask.new(:spec)
  RuboCop::RakeTask.new(:rubocop)

  task :coverage do
    ENV["COVERAGE"] = "true"
  end

  task test: [:coverage, :spec, :rubocop]
end
