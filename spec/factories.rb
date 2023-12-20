# FactoryBot.define do
#   # factory :user do
#   #   username { Faker::Internet.username }
#   #   email { Faker::Internet.email }
#   #   password { Faker::Internet.password }
#   # end

#   factory :user do
#     # Your user attributes here
#     username { "example_user" }
#     email { "user@example.com" }
#     password { "password123" }

#     # Add this line to generate authentication tokens
#     after(:create) { |user| user.create_new_auth_token }
#   end
  
#   factory :tutor do
#     name { 'Tutor 1' } # Adjust the attributes accordingly
#   end

#   # factory :tutorial do
#   #   title { Faker::Lorem.sentence }
#   #   tutorial_price { Faker::Number.number(digits: 2) }
#   #   scheduling_price { Faker::Number.number(digits: 2) }
#   #   description { Faker::Lorem.paragraph }
#   #   association :tutor
#   #   photo { Faker::Internet.url }
#   # end

#   factory :tutorial do
#     title { 'Math Basics' }
#     description { 'Learn the fundamental concepts of mathematics.' }
#     tutorial_price { 50 }
#     scheduling_price { 10 }
#     association :tutor
#     photo { 'https://s1.lprs1.fr/images/2021/04/14/8431165_nintendo-switch-lite-amazon.jpg' }
#   end
 

#   factory :reservation do
#     user
#     tutorial
#     reserve_date { Faker::Date.forward(days: 23) }
#   end
# end
