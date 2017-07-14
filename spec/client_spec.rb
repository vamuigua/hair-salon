#require spec_helper containing the required files to run the specs
require("spec_helper")


describe(Client) do

  #spec to return all the clients
  describe(".all") do
    it("returns empty clients from database") do
      expect(Client.all()).to(eq([]))
    end
  end

  #spec to return the client's name
  describe("#client_name") do
    it("returns the client_name") do
      test_client = Client.new({:client_name => "Stacy", :id => 1})
      expect(test_client.client_name()).to(eq("Stacy"))
    end
  end

  #spec to save a client to the database
  describe("#save") do
    it("adds a client to the array of saved clients") do
      test_client = Client.new({:client_name => "Eve", :id => nil})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  #to make two client objects with the same properties are treated the same in our specs
  describe("#==") do
    it("is the same client if it has the same name and id") do
      test_client1 = Client.new({:client_name => "Joy", :id => 1})
      test_client2 = Client.new({:client_name => "Joy", :id => 1})
      expect(test_client1).to(eq(test_client2))
    end
  end

  #spec to update details of a client
  describe("#update") do
    it("lets you update clients in the database") do
      test_client = Client.new({:client_name => "Jane", :id => nil})
      test_client.save()
      test_client.update({:client_name => "Faith"})
      expect(test_client.client_name()).to(eq("Faith"))
    end
  end

  describe("#delete") do
    it("Lets you delete clients in the database") do
      test_client1 = Client.new({:client_name => "Jane", :id => nil})
      test_client1.save()
      test_client2 = Client.new({:client_name => "Hope", :id => nil})
      test_client2.save()
      test_client1.delete()
      expect(Client.all()).to(eq([test_client2]))
    end
  end
end
