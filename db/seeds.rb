# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# 10.times do |n|
#     name = Faker::Name.name
#     email = "example-#{n+1}@gmail.com"
#     password="password"
#     date_of_birth = "1999-09-09"
#     user = User.create!(name: name,
#     email: email, password: password, password_confirmation: password,date_of_birth: date_of_birth)
#     5.times do |n|
#        content = "Hello this my #{n+1} post"
#        Post.create!(content: content,user_id: user.id)
#     end
# end

# 40.times do |n|
#     name = Faker::Name.name
#     email = "example-#{n+14}@gmail.com"
#     password="password"
#     date_of_birth = "1999-09-09"
#     user = User.create!(name: name,
#     email: email, password: password, password_confirmation: password,date_of_birth: date_of_birth)
# end
# users = User.last(20)
# users.each do |user|
#     3.times do |n|
#         content = "Hello everyone how are you, I wanna share with you my #{n+1} post *_* "
#         Post.create!(content: content,user_id: user.id)
#      end
# end
# users1 = User.last(40)
# users = users1.first(20)
# users.each do |user|
#     7.times do |n|
#         content = "Hello everyone , I wanna test my facebook app this is my #{n+1} post in facebook *_* "
#         Post.create!(content: content,user_id: user.id)
#      end
# end
