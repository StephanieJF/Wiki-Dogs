require 'random_data'

# Create Wikis
User.create!(email: 'test@example.com', password: 'password')

50.times do
  Wiki.create!(
          title: RandomData.random_sentence,
          body: RandomData.random_paragraph,
          user: User.first
  )
end

puts "Seed finished"
puts "#{Wiki.count} wikis created."