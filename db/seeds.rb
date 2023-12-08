# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# seeds.rb

tutorials_data = [
  {
    title: 'Math Basics',
    description: 'Learn the fundamental concepts of mathematics.',
    tutor_id: 1, # Replace with an existing tutor_id from your tutors table
    tutorial_price: 50,
    scheduling_price: 10,
    photo: 'https://s1.lprs1.fr/images/2021/04/14/8431165_nintendo-switch-lite-amazon.jpg' # Replace with the actual photo filename or URL
  },
  {
    title: 'Programming 101',
    description: 'Introduction to programming and coding.',
    tutor_id: 2,
    tutorial_price: 75,
    scheduling_price: 15,
    photo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/PS3Versions.png/800px-PS3Versions.png'
  },

  {
    title: 'English Grammar Mastery',
    description: 'Improve your English grammar skills.',
    tutor_id: 3,
    tutorial_price: 60,
    scheduling_price: 12,
    photo: 'english_grammar.jpg'
  },
  {
    title: 'History Through the Ages',
    description: 'Explore historical events and timelines.',
    tutor_id: 1,
    tutorial_price: 80,
    scheduling_price: 20,
    photo: 'history_through_ages.jpg'
  },
  {
    title: 'Physics Explorations',
    description: 'Dive into the world of physics and its wonders.',
    tutor_id: 2,
    tutorial_price: 70,
    scheduling_price: 15,
    photo: 'physics_explorations.jpg'
  },
  {
    title: 'Art Appreciation',
    description: 'Learn to appreciate and understand different art forms.',
    tutor_id: 3,
    tutorial_price: 55,
    scheduling_price: 10,
    photo: 'art_appreciation.jpg'
  }
  # Add more tutorial entries as needed
]

# Create tutorials
tutorials_data.each do |tutorial_data|
  Tutorial.create!(tutorial_data)
end
