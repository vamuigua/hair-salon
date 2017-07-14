#require spec_helper containing the required files to run the specs
require("spec_helper")


describe(Client) do

	#spec to return all the clients
	describe(".all") do
		it("returns empty clients from database") do
			expect(Client.all()).to(eq([]))
    	end
	end

	#spec to save a client to the database
	describe("#save") do
    	it("adds a client to the array of saved clients") do
      		test_client = Client.new({:client_name => "Eve", :stylist_id => 1})
      		test_client.save()
      		expect(Client.all()).to(eq([test_client]))
    	end
  	end

  	#to make two client objects with the same properties are treated the same in our specs
    describe("#==") do
      it("is the same client if it has the same name and stylist_id") do
        test_client1 = Client.new({:client_name => "Joy", :stylist_id => 1})
        test_client2 = Client.new({:client_name => "Joy", :stylist_id => 1})
        expect(test_client1).to(eq(test_client2))
      end
    end
end