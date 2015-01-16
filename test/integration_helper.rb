require 'test_helper'
require 'capybara'
require 'capybara/dsl'
require 'capybara/webkit'
require './test/fixtures/xss_test_app'

Capybara.app            = XssTestApp.new
Capybara.default_driver = :webkit

Capybara.add_selector(:target) do
  xpath { "//div[@id='target']" }
end
