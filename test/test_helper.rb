$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'factory'
require 'minitest/autorun'
require 'minitest/reporters'

MiniTest::Reporters.use! [Minitest::Reporters::SpecReporter.new]
