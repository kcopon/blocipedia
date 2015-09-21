require 'faker'

admin = User.new(
  name:     'Admin User',
  email:    'admin@example.com',
  password: 'helloworld',
  role:     'admin'
 )
 admin.skip_confirmation!
 admin.save!
 
 # Create a premium user
premium = User.new(
  name:     'Premium User',
  email:    'premium@example.com',
  password: 'helloworld',
  role:     'premium'
)
premium.skip_confirmation!
premium.save!
 
 # Create a standard user
standard = User.new(
  name:     'Standard User',
  email:    'standard@example.com',
  password: 'helloworld'
)
standard.skip_confirmation!
standard.save!

#Create Wikis
5.times do 
  Wiki.create(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
)
end

puts "seed finished!"
puts "#{Wiki.count} wikis created"
puts "Admin User created"
puts "Premium User created"
puts "Standard User created"