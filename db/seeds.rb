# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u = User.new
u.email = "metripurari@gmail.com"
u.password = "123456"
u.save

['admin', 'manager', 'enduser'].each do |role|
	r = Role.new(name: role)
	u.roles << r
end
u.save