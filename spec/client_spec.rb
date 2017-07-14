#require spec_helper containing the required files to run the specs
require("spec_helper")


describe(Client) do

	#spec to return all the clients
	describe(".all") do
		it("returns empty clients from database") do
        expect(Client.all()).to(eq([]))
    	end
	end
end