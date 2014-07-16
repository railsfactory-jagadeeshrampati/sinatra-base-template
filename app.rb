require 'rubygems'
require 'bundler/setup'
require 'sinatra'

configure do
  set :views, "#{File.dirname(__FILE__)}/views"
end



# root page
get '/' do
  @time =  Time.now
  erb :index
end  