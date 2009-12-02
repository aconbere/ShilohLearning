require 'rubygems'
require 'sinatra'
require 'hotels'

hotel = Hotel.new([])

get "/" do
  haml :index
end

post "/check-in" do
  @name = params["name"]
  greeting = hotel.add(@name)
  redirect "/checked-in"
end

get "/checked-in" do
  haml :check_in
end

get "/admin" do
  haml :admin
end

get "/check-out" do
  haml :check_out
end

post "/check-out" do
  @name = params["name"]
  hotel.remove(@name)
  redirect "/" 
end

get "/admin/list" do
  hotel.all.map{|c| c.name}.join("<br>")
end
