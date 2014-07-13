require 'rubygems'
require 'sinatra'

class Site < Sinatra::Base

  get '/' do
    @seconds_old = Time.now - Time.local(1987, 3, 12)
    @age = @seconds_old / 365.25 / 24 / 60 / 60
    erb :home
  end

  get '/design' do
    @show_navbar = true
    @show_footer = true
    erb :design
  end


  get '/about' do
    @show_navbar = true
    @show_footer = true
    erb :about
  end

  get '/okl-redesign' do
    @show_navbar = true
    @show_footer = true
    erb :oklredesign
  end

  get '/okl-directed-shopping' do
    @show_navbar = true
    @show_footer = true
    erb :okldirectedshopping
  end

  get '/okl-ipad' do
    @show_navbar = true
    @show_footer = true
    erb :oklipad
  end


  get '/jawbone-mobile' do
    @show_navbar = true
    @show_footer = true
    erb :jawbonemobile
  end


  get '/big-jambox-buttons' do
    @show_navbar = true
    @show_footer = true
    erb :bigjamboxbuttons
  end

  not_found do
    erb :notfound
  end

end
  