require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/stylist")
require('./lib/client')
require("pg")

DB = PG.connect({:dbname => "hair_salon"})

#route to index
get("/") do
  erb(:index)
end

#route to stylist's form
get("/stylists/new") do
  erb(:stylist_form)
end

#post request to post the stylists
post("/stylists") do
  stylist_name = params.fetch("stylist_name")
  new_stylist = Stylist.new({:stylist_name => stylist_name})
  new_stylist.save()
  erb(:success)
end


#get request to display stylists added
get("/stylists") do
  @stylists = Stylist.all()
  erb(:stylists)
end
