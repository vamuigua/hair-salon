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
        test_stylist2 = Stylist.new({:stylist_name => "Mercy", :id => 1})
        test_stylist2.save()
        expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
      end
    end
end