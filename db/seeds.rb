require 'faker'

# Create Users
5.times do
  User.create!(
          email: Faker::Internet.email,
          password: Faker::Internet.password
  )
end
users = User.all

# Create Wikis
20.times do
  Wiki.create!(
    user: users.sample,
    title: Faker::Dog.meme_phrase,
    body: Faker::Hipster.paragraph(2, false, 4),
    private: false
  )
end


# Create an admin user
admin = User.create!(
    email:    's.liepper@gmail.com',
    password: 'helloworld',
    role:     'admin'
)

# Create a premium member
premium = User.create!(
    email:    'stephanie408@aol.com',
    password: 'helloworld',
    role: 'premium'
)


puts "Seed finished"
puts "#{User.count} users created."
puts "#{Wiki.count} wikis created."