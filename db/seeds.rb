# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
u1 = User.create!(email: "ann@example.com", password: '111111')
u2 = User.create!(email: "david@example.com", password: '111111')

Task.destroy_all
Task.create!(title: "Heavy fridge", content: 'Need help', done: true, user: u1)
Task.create!(title: "Need some greenery in my apt", content: 'Will adopt your dying plants', done: false, user: u2)

Event.destroy_all
Event.create!(title: "BBQ in Treptower Park", content: "BYOB!", address: "Checkpoint Charlie", starts_at: Time.zone.now.to_datetime , user: u2)

Event.create!(title: "Yoga in Bellevue Park", content: "Sun salutations for all levels", address: 'Treptower Park', starts_at: Time.zone.now.to_datetime , user: u2)

Question.destroy_all
Question.create!(title: "Supermarket", content: "What's the best discounter here?", user: u1)

Question.create!(title: "New events", content: "When is the next gathering?", user: u2)

