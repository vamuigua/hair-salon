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
end