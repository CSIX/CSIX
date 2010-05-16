# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

t = User.create!(:username => "Admin", :email => "Chris@Salij.org", :password => "1234", :password_confirmation => "1234")
puts "Created default admin user. Username:'Admin', password:'1234'"

Role.create! :name => "admin"
puts "Created admin role"

t.role_id = Role.find_by_name("admin").id
t.save
puts "Default admin user given administrator rights"

puts ""
puts "Done seeding database"