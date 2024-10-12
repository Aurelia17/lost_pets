# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

Pet.destroy_all

30.times do
  pet = Pet.new(
    name: Faker::Creature::Dog.name,
    address: Faker::Address.full_address,
    species: %w[dog cat turtle dragon snake rabbit].sample,
    found_on: Faker::Date.between(from: 10.days.ago, to: Date.today)
  )
  pet.save!
  puts "#{pet.name} has been added!"
end
