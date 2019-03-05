# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning..."

Goal.destroy_all
Social.destroy_all
Technical.destroy_all
Profile.destroy_all
User.destroy_all
Category.destroy_all

puts "Cleaning done - Creating User and profile " 

rodolphe = User.create!(email: "rodolphe@mauvaisaupingpong.com")
Profile.create!(nickname: "Roro8", picture: "https://media.licdn.com/dms/image/C5603AQHu4lKzjy4a7Q/profile-displayphoto-shrink_200_200/0?e=1557360000&v=beta&t=6JOjfGLKCkVk3m1xsRjlwbVxhVeh22HuCIjyf3vDk2o", user_id: rodolphe.id)

puts "User and profile created - Creating Categories "

mus = Category.create!(label: "Mus", code: "Music")
mov = Category.create!(label: "Mov", code: "Movie")
foo = Category.create!(label: "Foo", code: "Food")
des = Category.create!(label: "Des", code: "Desk")

puts "Category created - Creating Goals "

Goal.create!(label: "Gam", code: "Gaming")
Goal.create!(label: "Sec", code: "Security")
Goal.create!(label: "Fin", code: "Finance")
Goal.create!(label: "VR", code: "Virtual Reality")
Goal.create!(label: "Gad", code: "Gadget")
Goal.create!(label: "App", code: "Apps")
Goal.create!(label: "Fun", code: "Fundings")
Goal.create!(label: "Tra", code: "Transportation")
Goal.create!(label: "Edu", code: "Education")

puts "Goals created - Creating Socials "

Social.create!(label: "dirty_room", code: "https://images.unsplash.com/photo-1512805668868-1608a189cc2b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2978&q=80", category_id: des.id)
Social.create!(label: "clean_room", code: "https://images.unsplash.com/photo-1526040652367-ac003a0475fe?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80", category_id: des.id)
Social.create!(label: "peace_music", code: "https://images.unsplash.com/photo-1421217336522-861978fdf33a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80", category_id: mus.id)
Social.create!(label: "metal_music", code: "https://images.unsplash.com/photo-1498038432885-c6f3f1b912ee?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80", category_id: mus.id)
Social.create!(label: "house_music", code: "https://images.unsplash.com/photo-1493676304819-0d7a8d026dcf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1934&q=80", category_id: mus.id)
Social.create!(label: "junk_food", code: "https://images.unsplash.com/photo-1517434324-1db605ff03c7?ixlib=rb-1.2.1&auto=format&fit=crop&w=975&q=80", category_id: foo.id)
Social.create!(label: "healthy_food", code: "https://images.unsplash.com/photo-1511690656952-34342bb7c2f2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1300&q=80", category_id: foo.id)
Social.create!(label: "cinema", code: "https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80", category_id: mov.id)
Social.create!(label: "netflix", code: "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80", category_id: mov.id)

puts "Socials created - Creating Technicals "

lan = Technical.create!(label: "Lan", code: "Languages")
sty = Technical.create!(label: "Sty", code: "Style")
exp = Technical.create!(label: "Exp", code: "Experience")

puts "Technicals created - Creating User_Technicals "

User_technical.create!(metric: "1", technical_id: lan.id)
User_technical.create!(metric: "1", technical_id: sty.id)
User_technical.create!(metric: "1", technical_id: exp.id)

puts "Seeds completed"


