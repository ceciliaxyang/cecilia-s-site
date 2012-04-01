require 'sinatra/base'
require './site'
require 'logger'

require 'nesta/app'
Nesta::App.root = ::File.expand_path('./blog', ::File.dirname(__FILE__))


#create a rack app
app = Rack::Builder.new do
  map '/blog' do
    run Nesta::App
  end

  #map all the other requests to sinatra
  map '/' do
    run Site
  end
end.to_app

run app