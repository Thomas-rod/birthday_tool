# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Let's go !!! We are seeding. It's so funny"

puts "Ok, first step - Clear the DBBBBBB"
User.destroy_all
Friend.destroy_all

puts "Well, it's done ! Now, let's go creating seeds"

puts "Second step : User creation - Initialization "
thomas = User.create!(first_name: "Thomas", last_name: "Rodier", email: "thomas@gmail.com", password: "thomas@gmail.com", birthday_date: Date.new(1995, 2, 17))
puts "Second step : #{User.count} Users have been created - Done"

puts "Third step : Friends creation - Initialization "
Friend.create!(user: thomas, first_name: "Thierry", last_name: "Rodier", birthday_date: Date.new(1966, 6, 15), nickname: "Dad", gender: "Male")
Friend.create!(user: thomas, first_name: "Christine", last_name: "Valain", birthday_date: Date.new(1960, 3, 15), nickname: "Mom", gender: "Female")
Friend.create!(user: thomas, first_name: "Quentin", last_name: "Rodier", birthday_date: Date.new(1995, 2, 17), nickname: "Brother",gender: "Male")
puts "Third step : #{Friend.count} Friends have been created - Done"


puts "Youppiiii work is done, i can go sleep now. I'm so ..Zzzzzz... tired. zZzzzzzZZ"
