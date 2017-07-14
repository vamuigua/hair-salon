#require spec_helper containing the required files to run the specs
require("spec_helper")

describe(Stylist) do

	#spec to return empty list of stylists
	describe(".all") do
		it("The list of Stylists is empty at first") do
			expect(Stylist.all()).to(eq([]))
		end
	end	
end