# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = MobileUser.create({"name" => "John", "surname" => "Doe",
                           "mobile_contact" => "12344", "alternative_contact" => "45321",
                           "next_of_kin" => "DJ", "mobile_of_kin" => "56478",
                           "physical_address" => "17 Melle street", "occupants_in_house_hold" => "abc"})

user2 = MobileUser.create({"name" => "Bob", "surname" => "Kelx",
                           "mobile_contact" => "67401", "alternative_contact" => "563",
                           "next_of_kin" => "kly", "mobile_of_kin" => "0987654321",
                           "physical_address" => "SPLICE", "occupants_in_house_hold" => "abc12"})

Incident.create({:category => "House Break in", :mobile_user => user1,
                 :location_attributes => {:latitude => "-26.1940509", :longitude => "28.0359692",
                                          :street => "17 Melle Street, Johannesburg 2000, South Africa"}})

Incident.create({:category => "House Break in", :mobile_user => user2,
                 :location_attributes => {:latitude => "40.714224", :longitude => "-73.961452",
                                          :street => "275-291 Bedford Ave, Brooklyn, NY 11211, USA"}})

Incident.create({:category => "House Break in", :mobile_user => user1,
                 :location_attributes => {:latitude => "-26.1840509", :longitude => "28.0359692",
                                          :street => "12 Girton Road, Johannesburg 2193, South Africa"}})
