# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.destroy_all

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
    p p
    p.categories << main_cat.categories.sample
    puts p.categories
  end
end

goals = [
  'Apps',
  'Biotech',
  'Education',
  'Finance', 
  'Funding',
  'Gadgets',
  'Gaming',
  'Policy',
  'Security',
  'Space',
  'Transportation',
  'Virtual Reality',
]

goals.each { |g| Category.create!(name: g, stamp: 'goal') }

puts "Seeds completed"


