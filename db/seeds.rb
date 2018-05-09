require 'random_data'

# Create Users
5.times do
  User.create!(
          email: RandomData.random_email,
          password: RandomData.random_sentence
  )
end
users = User.all

# Create Wikis
50.times do
  Wiki.create!(
    user: users.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
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