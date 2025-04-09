# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Message.destroy_all
Chat.destroy_all
User.destroy_all

characters = [
  { first_name: "Frodo", last_name: "Baggins" },
  { first_name: "Samwise", last_name: "Gamgee" },
  { first_name: "Gandalf", last_name: "The Grey" },
  { first_name: "Aragorn", last_name: "Elessar" },
  { first_name: "Legolas", last_name: "Greenleaf" },
  { first_name: "Gimli", last_name: "Son of Glóin" },
  { first_name: "Boromir", last_name: "of Gondor" },
  { first_name: "Merry", last_name: "Brandybuck" },
  { first_name: "Pippin", last_name: "Took" },
  { first_name: "Galadriel", last_name: "of Lothlórien" }
]

characters.each_with_index do |char|
    User.create!(
        email: "#{char[:first_name].downcase}@middleearth.com",
        first_name: char[:first_name],
        last_name: char[:last_name]
    )
end

10.times do |i|
    Chat.create!(
        sender_id: i + 1,
        receiver_id: i * 10,
    )
end

10.times do |i|
    Message.create!(
        chat_id: i,
        user_id: i * 2,
        body: "Message #{i + 1}",
    )
end