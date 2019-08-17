# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
	Attendance.destroy_all
	Event.destroy_all
	User.destroy_all
	for i in 1..20 do
		User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,description: Faker::Hipster.paragraph(sentence_count: 2), encrypted_password: rand(100000..125485700000),email: "kima#{i}@yopmail.com")
	end
	puts "user done 1"
	u = User.all
	10.times do
		Event.create(start_date: Time.now ,
   	duration: rand(500),
    title: Faker::Name.first_name,
    description: Faker::Hipster.paragraph(sentence_count: 2),
    price: rand(1000),
    location: Faker::Address.city,
    admin: u[rand(0..19)] ,
    participants: [u[rand(0..19)],u[rand(0..19)],u[rand(0..19)]] )
	end
puts "user done 2"