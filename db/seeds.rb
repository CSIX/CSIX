# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
Role.create! :name => "admin"
Role.create! :name => "user"
puts "Created default roles"

admin = User.create!(:username => "Admin", :email => "admin@csix.com", :password => "1234", :password_confirmation => "1234")
user = User.create!(:username => "User", :email => "user@csix.com", :password => "12345", :password_confirmation => "12345")
admin.role_id = Role.find_by_name("admin").id
user.role_id = Role.find_by_name("user").id
admin.save
user.save
puts "Created default admin. Username:'Admin', password:'1234'"
puts "Created default normal user. Username:'User', password:'12345'"

puts ""
puts "Done seeding database"