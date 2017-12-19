require 'simplecov'
require 'simplecov-console'
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new [
  SimpleCov::Formatter::HTMLFormatter,
  SimpleCov::Formatter::Console,
]
SimpleCov.start do
  add_filter ".bundle"
  add_filter "template_steps"
end
