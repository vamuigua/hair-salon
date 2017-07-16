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
  new_stylist = Stylist.new({:stylist_name => stylist_name, :id => nil})
  new_stylist.save()
  @stylists = Stylist.all()
  erb(:success)
end


#get request to display stylists added
get("/stylists") do
  @stylists = Stylist.all()
  erb(:stylists)
end

#post request to post client_name and id for a new Stylist created
post("/clients") do
  client_name = params.fetch("client_name")
  client_id = params.fetch("id").to_i()
  @client = Client.new({:client_name => client_name, :id => client_id})
  @client.save()
  erb(:stylist)
end

#get request to view specific stylist
get("/stylists/:id") do
  id = params.fetch("id").to_i()
  @stylist = Stylist.find(id)
  erb(:stylist)
end

#post stylists according to the id
post("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  client_name = params.fetch("client_name")
  new_client = Client.new({:client_name=>client_name})
  @stylist.add_client(new_client)
  erb(:stylist)
end

#route to edit a particular stylist
get("/stylists/:id/edit") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist_edit)
end

#to edit/patch a particular stylist
patch("/stylists/:id") do
  stylist_name = params.fetch("stylist_name")
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.update({:stylist_name => stylist_name})
  erb(:stylist)
end

#route to delete a list
delete("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.delete()
  @stylists = Stylist.all()
  erb(:stylists)
end
