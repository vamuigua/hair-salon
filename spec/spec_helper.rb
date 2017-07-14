#require the same files and gems 
require("rspec")
  require("pg")
  require("stylist")
  require("client")

#create a database connection
  DB = PG.connect({:dbname => "hair_salon_test"})

#set up RSpec to clean the database between test runs
  RSpec.configure do |config|
    config.after(:each) do
      DB.exec("DELETE FROM stylists *;")
      DB.exec("DELETE FROM clients *;")
    end
  end