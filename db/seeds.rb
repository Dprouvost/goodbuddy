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

puts "Cleaning done - Creating Users and profiles " 

r_user = User.create!(email: "Rodolphe8@github.com", password: "123456")
r_profile = Profile.create!(nickname: "Roro8", picture: "https://media.licdn.com/dms/image/C5603AQHu4lKzjy4a7Q/profile-displayphoto-shrink_200_200/0?e=1557360000&v=beta&t=6JOjfGLKCkVk3m1xsRjlwbVxhVeh22HuCIjyf3vDk2o", user_id: r_user.id, location: "lille", description: "Je cherche l'amour")

d_user = User.create!(email: "Dprouvost@github.com", password: "123456")
d_profile = Profile.create!(nickname: "Dimi", picture: "https://media.licdn.com/dms/image/C5603AQHu4lKzjy4a7Q/profile-displayphoto-shrink_200_200/0?e=1557360000&v=beta&t=6JOjfGLKCkVk3m1xsRjlwbVxhVeh22HuCIjyf3vDk2o", user_id: d_user.id, location: "hem", description: "Je cherche ma route")

t_user = User.create!(email: "Theo@github.com", password: "123456")
t_profile = Profile.create!(nickname: "Theo", picture: "https://media.licdn.com/dms/image/C5603AQHu4lKzjy4a7Q/profile-displayphoto-shrink_200_200/0?e=1557360000&v=beta&t=6JOjfGLKCkVk3m1xsRjlwbVxhVeh22HuCIjyf3vDk2o", user_id: t_user.id, location: "bondues", description: "Je cherche la gloire")

a_user = User.create!(email: "Antho@github.com", password: "123456")
a_profile = Profile.create!(nickname: "Antho", picture: "https://media.licdn.com/dms/image/C5603AQHu4lKzjy4a7Q/profile-displayphoto-shrink_200_200/0?e=1557360000&v=beta&t=6JOjfGLKCkVk3m1xsRjlwbVxhVeh22HuCIjyf3vDk2o", user_id: a_user.id, location: "tournai", description: "Je cherche à comprendre")

puts "Users and profiles created - Creating Categories"

socials_array = [
  {
    name: 'music',
    sub_cats: ['rock', 'house']
  },
  {
    name: 'movie',
    sub_cats: ['cinema', 'netflix']
  },
  {
    name: 'food',
    sub_cats: ['junk', 'healthy']
  },
  {
    name: 'desk',
    sub_cats: ['clean', 'dirty']
  }
]

socials_array.each do |social|
  main_cat = Category.create!(name: social[:name], stamp: 'social')
  social[:sub_cats].each do |sc|
    Category.create!(name: sc, stamp: 'social', category: main_cat)
  end
  Profile.all.each do |p|
    p.categories << main_cat.categories.sample
  end
end

goals = [
  'gaming',
  'virtual reality',
  'transportation',
  'finance'
]

goals.each { |g| Category.create!(name: g, stamp: 'goal') }

Profile.all.each do |p|
  Category.where(stamp: 'goal').sample(3).each { |c| p.categories << c }
end

# music = Category.create!(name: "music", stamp: "social")
# music_type = Category.create!(name: "house", stamp: "social", category_id: music.id)

# stamp = Category.create!(name: "", stamp: "goal")
# r_scg = Category.create!(name: "gaming", stamp: "goal", category_id: r_cg.id)
# r_profile.categories << r_sc
# r_profile.categories << r_scg

# d_c = Category.create!(name: "music", stamp: "social")
# d_sc = Category.create!(name: "metal", stamp: "social", category_id: d_c.id)
# d_cg = Category.create!(name: "", stamp: "goal")
# d_scg = Category.create!(name: "gaming", stamp: "goal", category_id: d_cg.id)
# d_profile.categories << d_sc
# d_profile.categories << d_scg

# t_c = Category.create!(name: "music", stamp: "social")
# t_sc = Category.create!(name: "metal", stamp: "social", category_id: t_c.id)
# t_cg = Category.create!(name: "", stamp: "goal")
# t_scg = Category.create!(name: "transportation", stamp: "goal", category_id: t_cg.id)
# t_profile.categories << t_sc
# t_profile.categories << t_scg

# a_c = Category.create!(name: "music", stamp: "social")
# a_sc = Category.create!(name: "house", stamp: "social", category_id: a_c.id)
# a_cg = Category.create!(name: "", stamp: "goal")
# a_scg = Category.create!(name: "gaming", stamp: "goal", category_id: a_cg.id)
# a_profile.categories << a_sc
# a_profile.categories << a_scg


puts "Categories created - Creating technicals and weightings "

t = Technical.create!(profile_id: r_profile.id, language_1: "ruby", language_2: "HTML", language_3: "css", commit_slot: 1, github_age: 60, number_of_projects: 7, total_commits: 50, followers: 10000)
w = Weighting.create!(profile_id: r_profile.id, social: 0.5, language: 0.2, style: 0.1, experience: 0.2)

t = Technical.create!(profile_id: d_profile.id, language_1: "ruby", language_2: "css", language_3: "HTML", commit_slot: 2, github_age: 120, number_of_projects: 12, total_commits: 70, followers: 20000)
w = Weighting.create!(profile_id: d_profile.id, social: 0.5, language: 0.2, style: 0.1, experience: 0.2)

t = Technical.create!(profile_id: t_profile.id, language_1: "css", language_2: "HTML", language_3: "php", commit_slot: 4, github_age: 30, number_of_projects: 3, total_commits: 20, followers: 5000)
w = Weighting.create!(profile_id: t_profile.id, social: 0.5, language: 0.2, style: 0.1, experience: 0.2)

t = Technical.create!(profile_id: a_profile.id, language_1: "ruby", language_2: "HTML", language_3: "css", commit_slot: 3, github_age: 200, number_of_projects: 77, total_commits: 150, followers: 100000)
w = Weighting.create!(profile_id: a_profile.id, social: 0.5, language: 0.2, style: 0.1, experience: 0.2)

puts "Seeds completed"


