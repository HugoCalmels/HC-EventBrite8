# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Faker::Config.locale = 'fr'

User.destroy_all
Event.destroy_all
Attendance.destroy_all

20.times do
  
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
  )
end

10.times do
 
  Event.create(
    start_date: Faker::Date.forward(days: 30).to_datetime,
    duration: rand(10..60),
    title: Faker::Lorem.paragraph_by_chars(number: rand(3..40)),
    description: Faker::Lorem.paragraph_by_chars(number: rand(10..150)),
    price: rand(1..50),
    location: Faker::Lorem.word,
    user_id: User.all.sample
    
  )
end

40.times do
  Attendance.create(
    stripe_customer_id: Faker::Number.number(digits: 10),
    user_id: User.all.sample,
    event_id: Event.all.sample
  )
end

puts "%"*50
puts 'BASE DE DONNEES REMPLIE'
puts "%"*50