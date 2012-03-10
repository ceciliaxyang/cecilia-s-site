require 'rubygems'
require 'sinatra'

get '/' do
  erb :work
end

get '/info' do
  @name = 'Cecilia'
  @seconds_old = Time.now - Time.local(1987, 3, 12)
  @age = @seconds_old / 365 / 24 / 60 / 60
  erb :info
end

get '/blog' do
  erb :blog
end

get '/contact' do
  erb :contact
end

not_found do
  erb :notfound
end

  
  