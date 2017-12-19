require 'simplecov'
SimpleCov.start
# Sinatra
require File.join(File.dirname(__FILE__), *%w[.. .. app])
# Force the application name because polyglot breaks the auto-detection logic.
Sinatra::Application.app_file = File.join(File.dirname(__FILE__), *%w[.. .. app.rb])

require 'rspec/expectations'
require 'capybara/cucumber'
require 'capybara/poltergeist' #Javascript


class MyWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

Capybara.javascript_driver = :poltergeist

Capybara.register_driver :poltergeist do |app|
  options = {
      :js_errors => true,
      :timeout => 120,
      :debug => false,
      :phantomjs_options => ['--load-images=no', '--disk-cache=false'],
      :inspector => true,
  }

  Capybara::Poltergeist::Driver.new(app, options)

end

Capybara.app = Sinatra::Application

World{MyWorld.new}

