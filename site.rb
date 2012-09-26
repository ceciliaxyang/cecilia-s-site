require 'rubygems'
require 'sinatra'

class Site < Sinatra::Base

  get '/' do
    @seconds_old = Time.now - Time.local(1987, 3, 12)
    @age = @seconds_old / 365.25 / 24 / 60 / 60
    erb :info
  end

  get '/work' do
    erb :work
  end

  get '/blogtemp' do
    erb :blogtemp
  end

  get '/info' do
    erb :info
  end
  
  get '/instagram' do
    erb :instagram
  end

  not_found do
    erb :notfound
  end

end
  