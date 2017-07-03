# This file is used by Rack-based servers to start the application.

#require_relative 'config/environment'

require File.expand_path("../lib/foo", __FILE__)
run Rails.application
