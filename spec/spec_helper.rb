require 'simplecov'
require 'simplecov-console'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :should
  end
  config.mock_with :rspec do |c|
    c.syntax = :should
  end
end

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter::new(Array([
  SimpleCov::Formatter::HTMLFormatter,
  SimpleCov::Formatter::Console,
]))
SimpleCov.start do
  add_filter ".bundle"
  add_filter "template_steps"
end
