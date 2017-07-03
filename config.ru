# This file is used by Rack-based servers to start the application.

#require_relative 'config/environment'

$:.unshift File.expand_path("../lib", __FILE__) require'foo'

run Rails.application
