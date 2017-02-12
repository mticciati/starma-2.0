# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create!([
  { :username => "Meow1", :email => "meow1@meow.com", :password => "1234", :password_confirmation => "1234", birthday: "1990-01-01", location: "San Francisco, ca", latitude: 37.7749, longitude: -122.419, role: "admin" },
  { :username => "Meow2", :email => "meow2@meow.com", :password => "1234", :password_confirmation => "1234", birthday: "1992-02-02", location: "San Francisco, ca", latitude: 37.7749, longitude: -122.419 },
  { :username => "Meow3", :email => "meow3@meow.com", :password => "1234", :password_confirmation => "1234", birthday: "1992-02-02", location: "San Francisco, ca", latitude: 37.7749, longitude: -122.419 },
  { :username => "Meow4", :email => "meow4@meow.com", :password => "1234", :password_confirmation => "1234", birthday: "1992-02-02", location: "San Francisco, ca", latitude: 37.7749, longitude: -122.419 }
])