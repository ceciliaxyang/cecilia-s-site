require 'rubygems'
require 'sinatra'

get '/' do
  @seconds_old = Time.now - Time.local(1987, 3, 12)
  @age = @seconds_old / 365.25 / 24 / 60 / 60
  erb :home
end

get '/work' do
  erb :work
end

get '/blog' do
  erb :blog
end

get '/info' do
  erb :info
end

not_found do
  erb :notfound
end

  
  