# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "faker"
Booking.destroy_all
Pony.destroy_all
User.destroy_all

user = User.create!(
email: "test@test.com",
password: "123456"
)

10.times do
  postal_code = Faker::Address.zip
  city = Faker::Address.city

  Pony.create!(
    name: Faker::Creature::Horse.name,
    price: Faker::Commerce.price(range: 300..15000),
    alias: Faker::Creature::Horse.name,
    sex: ['Male', 'Female'].sample,
    color: Faker::Color.color_name,
    breed: Faker::Creature::Horse.breed,
    discipline: ["Jumping", "Dressage", "Circus"].sample,
    description: "Modify it when creating your pony's listing.",
    user: user,
    address: "#{Faker::Address.street_address}, #{postal_code} #{city}"
  )
end
