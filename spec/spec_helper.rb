# test_helper.rb
ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'
require_relative '../app'

class MiniTest::Spec
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end
end
