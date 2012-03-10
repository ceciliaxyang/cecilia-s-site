require 'rubygems'
require 'sinatra'

get '/' do
  erb :home
end

get '/about' do
  @name = 'Cecilia'
  @seconds_old = Time.now - Time.local(1987, 3, 12)
  @age = @seconds_old / 365 / 24 / 60 / 60
  erb :about
end

get '/work' do
  erb :work
end

not_found do
  '404!'
end

  
  