# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning..."

Category.destroy_all
User.destroy_all

puts "Cleaning done - Creating User and profile " 

r_user = User.create!(email: "Rodolphe8@github.com", password: "123456")
r_profile = Profile.create!(nickname: "Roro8", picture: "https://media.licdn.com/dms/image/C5603AQHu4lKzjy4a7Q/profile-displayphoto-shrink_200_200/0?e=1557360000&v=beta&t=6JOjfGLKCkVk3m1xsRjlwbVxhVeh22HuCIjyf3vDk2o", user_id: r_user.id, location: "lille", description: "Je cherche l'amour")

puts "User and profile created - Creating Categories "

c = Category.create!(name: "music", stamp: "social")
sc = Category.create!(name: "house", stamp: "social", category_id: c.id)

r_profile.categories << sc

puts "Categories created - Creating technicals and weightings "

t = Technical.create!(profile_id: r_profile.id, language_1: "ruby", language_2: "HTML", language_3: "css", commit_slot: 1, github_age: 60, number_of_projects: 7, total_commits: 50, followers: 10000)
w = Weighting.create!(profile_id: r_profile.id, social: 0.5, language: 0.2, style: 0.1, experience: 0.2)

puts "Seeds completed"


