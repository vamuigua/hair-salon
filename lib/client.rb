class Client

  #attribute_accessor
  attr_reader(:client_name,:id)

  #initialize method
  define_method(:initialize) do |attributes|
    @id=attributes.fetch(:id)
    @client_name = attributes.fetch(:client_name)
  end

  #class method to return all clients from the database
  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each() do |client|
      client_id=client.fetch('id').to_i
      client_name = client.fetch("client_name")
      stylist_id = client.fetch("stylist_id").to_i()
      clients.push(Client.new({:id=>client_id, :client_name => client_name}))
    end
    clients
  end

  #method to save a client to the database
  define_method(:save) do
    # DB.exec("INSERT INTO clients (client_name, stylist_id) VALUES ('#{@client_name}', #{@stylist_id});")
    result=DB.exec("INSERT INTO clients (client_name) VALUES ('#{@client_name}') RETURNING id;")
    @id=result.first.fetch('id').to_i
  end

  #making two client object with same name be treated as the same
  define_method(:==) do |another_client|
    self.client_name().==(another_client.client_name())
  end

  #method to update a specific client
  define_method(:update) do |attributes|
    @client_name = attributes.fetch(:client_name)
    DB.exec("UPDATE clients SET client_name = '#{@client_name}' WHERE id = #{@id.to_i};")
  end

  #method to delete a specific client
  define_method(:delete) do
    id=self.id.to_i
    DB.exec("DELETE FROM clients WHERE id = #{id};")
  end
end
