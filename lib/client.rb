class Client

	#attribute_accessor
	attr_reader(:client_name,:stylist_id)

	#initialize method
	define_method(:initialize) do |attributes|
		@client_name = attributes.fetch(:client_name)
		@stylist_id = attributes.fetch(:stylist_id)
	end

	#class method to return all clients from the database
	define_singleton_method(:all) do
      returned_clients = DB.exec("SELECT * FROM clients;")
      clients = []
      returned_clients.each() do |client|
        client_name = client.fetch("client_name")
        stylist_id = client.fetch("stylist_id").to_i()
        clients.push(Client.new({:client_name => client_name, :stylist_id => stylist_id}))
      end
      clients
    end

    #method to save a client
    define_method(:save) do
      DB.exec("INSERT INTO clients (client_name, stylist_id) VALUES ('#{@client_name}', #{@stylist_id});")
    end
end