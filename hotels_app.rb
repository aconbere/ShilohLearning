require 'rubygems'
require 'sinatra'
require 'hotels'

hotel = Hotel.new([])

get "/" do
  haml :index
end

post "/check-in" do
  @name = params["name"]
  greeting = hotel.add(@name);
  haml :check_in
end

get "/admin" do
  "This is the admin section of the site

   <a href=\"/list\">List of Customers</a>"
end

get "/admin/list" do
  hotel.all.map{|c| c.name}.join("<br>")
end
