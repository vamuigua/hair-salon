class Stylist

	#attribute_accessor to read and write
	attr_accessor(:id,:stylist_name)

	#define initialize method
	define_method(:initialize) do |attributes|
		@stylist_name = attributes.fetch(:stylist_name)
		@id = attributes.fetch(:id)
	end
end