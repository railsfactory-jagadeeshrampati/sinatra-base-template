require 'rubygems'
require 'bundler/setup'

ENV['RACK_ENV'] = 'test'

require 'app'
require 'sinatra'
require 'test/unit'
require 'rack/test'

class HelloWorldTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_it_says_hello_world
    get '/'
    assert last_response.ok?
    # assert_equal 'Hello World', last_response.body # made it into a html page
    assert last_response.body.include? "Hello World"
  end


end