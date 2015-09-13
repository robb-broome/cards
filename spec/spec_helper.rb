require 'minitest/autorun'
require 'minitest/reporters'
require 'pry'

require File.expand_path('../../config/environment', __FILE__)
reporter_options = { color: true, slow_count: 5 }
Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new(reporter_options)]

