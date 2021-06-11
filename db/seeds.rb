# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

=begin
#creating users for testing
User.create(username: "Mashrur", password: "password")
User.create(username: "Nishant", password: "password")
User.create(username: "Tony", password: "password")
User.create(username: "Josh", password: "password")
User.create(username: "Simon", password: "password")
=end

=begin
#creating messages for testing
Message.create(body: "Hello!", user_id: 3)
Message.create(body: "Hey!", user_id: 1)
Message.create(body: "Whats sup?", user_id: 4)
Message.create(body: "Goodbye", user_id: 5)
=end
