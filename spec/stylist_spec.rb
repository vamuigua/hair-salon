#require spec_helper containing the required files to run the specs
require("spec_helper")

describe(Stylist) do

	#spec to return empty list of stylists
	describe(".all") do
		it("The list of Stylists is empty at first") do
			expect(Stylist.all()).to(eq([]))
		end
	end

	#spec to return stylist's name
	describe("#stylist_name") do
      it("tells you the stylist's name") do
        test_stylist = Stylist.new({:stylist_name => "Jane", :id => 1})
        expect(test_stylist.stylist_name()).to(eq("Jane"))
      end
    end

    #spec to return the id of a stylist
    describe("#id") do
      it("sets the stylist's ID when you save it") do
        test_stylist = Stylist.new({:stylist_name => "Jane", :id => 1})
        test_stylist.save()
        expect(test_stylist.id()).to(be_an_instance_of(Fixnum))
      end
    end

	#spec to save a stylist and return the new stylist
	describe("#save") do
      it("lets you save stylists to the database") do
        stylist = Stylist.new({:stylist_name => "Jane", :id => 1})
        stylist.save()
        expect(Stylist.all()).to(eq([stylist]))
      end
    end	

    #spec to make stylist same if it has the same name
    describe("#==") do
      it("is the same stylist if it has the same name") do
        stylist1 = Stylist.new({:stylist_name => "Jane", :id => 1})
        stylist2 = Stylist.new({:stylist_name => "Jane", :id => 1})
        expect(stylist1).to(eq(stylist2))
      end
    end

    #spec to find id of a specific stylist
    describe(".find") do
      it("returns a stylist by his/her ID") do
        test_stylist = Stylist.new({:stylist_name => "Jane", :id => 1})
        test_stylist.save()
        test_stylist2 = Stylist.new({:stylist_name => "Mercy", :id => 2})
        test_stylist2.save()
        expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
      end
    end

    #spec to return clients of a particular stylist
    # describe("#clients") do
    #   it("returns an array of clients for that stylist") do
    #     test_stylist = Stylist.new({:stylist_name => "Jane", :id => 1})
    #     test_stylist.save()
    #     test_client = Client.new({:client_name => "Mercy", :stylist_id => test_stylist.id()})
    #     test_client.save()
    #     test_client2 = Client.new({:client_name => "Joy", :stylist_id => test_stylist.id()})
    #     test_client2.save()
    #     expect(test_stylist.clients()).to(eq([test_client, test_client2]))
    #   end
    # end

    #spec to update details of a stylist
    describe("#update") do
      it("lets you update stylists in the database") do
        test_stylist = Stylist.new({:stylist_name => "Jane", :id => nil})
        test_stylist.save()
        test_stylist.update({:stylist_name => "Faith"})
        expect(test_stylist.stylist_name()).to(eq("Faith"))
      end
    end

    #spec to delete stylist and the clients related to the specific stylist
    describe("#delete") do
      it("lets you delete a stylist from the database") do
        test_stylist1 = Stylist.new({:stylist_name => "Jane", :id => nil})
        test_stylist1.save()
        test_stylist2 = Stylist.new({:stylist_name => "Mary", :id => nil})
        test_stylist2.save()
        test_stylist1.delete()
        expect(Stylist.all()).to(eq([test_stylist2]))
      end
      # it("deletes a Stylist's clients from the database") do
      #   test_stylist = Stylist.new({:stylist_name => "Jane", :id => nil})
      #   test_stylist.save()
      #   test_client1 = Client.new({:client_name => "Faith", :stylist_id => stylist_id()})
      #   test_client1.save()
      #   test_client2 = Client.new({:client_name => "Mary", :stylist_id => stylist_id()})
      #   test_client2.save()
      #   test_stylist.delete()
      #   expect(Client.all()).to(eq([]))
      # end
    end
end