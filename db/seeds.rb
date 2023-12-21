# seed.rb

tutorials_data = [
  {
    title: "Learn React Basics",
    description: "A comprehensive guide to understanding the basics of React.",
    tutorial_price: 50,
    scheduling_price: 25,
    author_id: 2,
    photo: "react_basics.jpg",
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    title: "Ruby on Rails Crash Course",
    description: "Get started with Ruby on Rails and build your first web application.",
    tutorial_price: 75,
    scheduling_price: 40,
    author_id: 3,
    photo: "rails_crash_course.jpg",
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    title: "Ruby on Rails Crash Course",
    description: "Get started with Ruby on Rails and build your first web application.",
    tutorial_price: 75,
    scheduling_price: 40,
    author_id: 3,
    photo: "rails_crash_course.jpg",
    created_at: Time.now,
    updated_at: Time.now
  }
]

tutorials_data.each { |tutorial| Tutorial.create(tutorial) }

puts "Seed data has been successfully added."
