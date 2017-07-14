class Client

	#attribute_accessor
	# attribute_accessor(:client_name,:stylist_id)

	define_method(:initialize) do |attributes|
		@client_name = attributes.fetch(:client_name)
		@stylist_id = attributes.fetch(:stylist_id)
	end
end