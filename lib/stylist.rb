class Stylist

  #attribute_accessor to read and write
  attr_accessor(:stylist_name,:id)

  #define initialize method
  define_method(:initialize) do |attributes|
    @stylist_name = attributes.fetch(:stylist_name)
    @id = attributes.fetch(:id)
  end

  #define class method to return all the Stylists
  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    stylists = []
    returned_stylists.each() do |stylist|
      stylist_name = stylist.fetch("stylist_name")
      id = stylist.fetch("id").to_i()
      stylists.push(Stylist.new({:stylist_name => stylist_name, :id => id}))
    end
    stylists
  end

  #method to save stylists to DB
  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (stylist_name) VALUES ('#{@stylist_name}') RETURNING id;")
    #first() is used to get the ID of the list and fetch() to select the ID
    @id = result.first().fetch("id").to_i()
  end

  #method to make objects be same if they have the same name
  define_method(:==) do |another_stylist|
    self.stylist_name().==(another_stylist.stylist_name()).&(self.id().==(another_stylist.id()))
  end

  #method to find specific id of a stylist
  define_singleton_method(:find) do |id|
    found_stylist = nil
    Stylist.all().each() do |stylist|
      if stylist.id().==(id)
        found_stylist = stylist
      end
    end
    found_stylist
  end

  #method to add a client to the database
  define_method(:add_client) do |client_id|
    @stylist_id = self.id.to_i()
    DB.exec("UPDATE clients SET stylist_id = #{@stylist_id} WHERE id=#{client_id};")
  end

  #method to return all the clients for a specific stylist from DB
  define_method(:clients) do
    list_clients = []
    clients = DB.exec("SELECT * FROM clients WHERE stylist_id = #{self.id().to_i};")
    clients.each() do |client|
      client_name = client.fetch("client_name")
      id = client.fetch("id").to_i()
      list_clients.push(Client.new({:client_name => client_name, :id => id}))
    end
    list_clients
  end

  #method to update the stylist details
  define_method(:update) do |attributes|
    @stylist_name = attributes.fetch(:stylist_name)
    @id = self.id()
    DB.exec("UPDATE stylists SET stylist_name = '#{@stylist_name}' WHERE id = #{@id};")
  end

  #method to delete a stylist and the clients assosiated to the stylist
  define_method(:delete) do
    DB.exec("DELETE FROM stylists WHERE id = #{self.id()};")
    DB.exec("DELETE FROM clients WHERE stylist_id = #{self.id()};")
  end
end
