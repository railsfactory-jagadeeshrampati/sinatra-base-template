require 'rubygems'
require 'bundler/setup'
require 'sinatra'

configure do
  set :views, "#{File.dirname(__FILE__)}/views"
end

enable :sessions
set :session_secret, 'randomesecretkey112324'


# root page
get '/' do
  @time =  Time.now
  erb :index
end  