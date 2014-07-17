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



get '/erb_example' do
  @names = ["Pavani","Usha","Surekha","Sujitha","Manjusagar","Veeresh","Deepanker","Pavankumar","Jagadeesh"].shuffle
  erb :example
end  



get '/login' do

erb :login
end

post '/login' do
  session[:username]= params[:username]
  erb :login
end


get '/logout' do
  session.clear
  @message= "you have been logged out"
  erb :logout
end  


