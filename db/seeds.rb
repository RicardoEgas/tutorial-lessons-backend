# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# # Create tutors
# tutors_data = [
#   { name: 'Tutor 1' },
#   { name: 'Tutor 2' },
#   { name: 'Tutor 3' },
#   # Add more tutors as needed
# ]

# tutors_data.each do |tutor_data|
#   tutor = Tutor.create!(tutor_data)
# #   FactoryBot.create(:tutorial, tutor: tutor)
# Tutorial.create!(
#     title: 'Math Basics',
#     description: 'Learn the fundamental concepts of mathematics.',
#     tutorial_price: 50,
#     scheduling_price: 10,
#     photo: 'https://s1.lprs1.fr/images/2021/04/14/8431165_nintendo-switch-lite-amazon.jpg'
#   )
# end

# # Fetch tutors
# tutor1 = Tutor.find_by(name: 'Tutor 1')
# tutor2 = Tutor.find_by(name: 'Tutor 2')
# tutor3 = Tutor.find_by(name: 'Tutor 3')

# Create tutorials
tutorials_data = [
  {
    title: 'Math Basics',
    description: 'Learn the fundamental concepts of mathematics.',
    tutorial_price: 50,
    scheduling_price: 10,
    photo: 'https://s1.lprs1.fr/images/2021/04/14/8431165_nintendo-switch-lite-amazon.jpg'
  },
  {
    title: 'Programming 101',
    description: 'Introduction to programming and coding.',
    tutorial_price: 75,
    scheduling_price: 15,
    photo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/PS3Versions.png/800px-PS3Versions.png'
  },
  {
    title: 'English Grammar Mastery',
    description: 'Improve your English grammar skills.',
    tutorial_price: 60,
    scheduling_price: 12,
    photo: 'english_grammar.jpg'
  },
# tutorials_data = [
  {
    title: 'Math Basics',
    description: 'Learn the fundamental concepts of mathematics.',
    tutorial_price: 50,
    scheduling_price: 10,
    photo: 'https://s1.lprs1.fr/images/2021/04/14/8431165_nintendo-switch-lite-amazon.jpg' # Replace with the
  },
  {
    title: 'Programming 101',
    description: 'Introduction to programming and coding.',
    tutorial_price: 75,
    scheduling_price: 15,
    photo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/PS3Versions.png/800px-PS3Versions.png'
  },

  {
    title: 'English Grammar Mastery',
    description: 'Improve your English grammar skills.',
    tutorial_price: 60,
    scheduling_price: 12,
    photo: 'english_grammar.jpg'
  },
  {
    # tutor: 'tutor4',
    title: 'History Through the Ages',
    description: 'Explore historical events and timelines.',
    tutorial_price: 80,
    scheduling_price: 20,
    photo: 'history_through_ages.jpg'
  },
  {
    title: 'Physics Explorations',
    description: 'Dive into the world of physics and its wonders.',
    tutorial_price: 70,
    scheduling_price: 15,
    photo: 'physics_explorations.jpg'
  },
  {
    # tutor: 'tutor6',  
  title: 'Art Appreciation',
    description: 'Learn to appreciate and understand different art forms.',
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
