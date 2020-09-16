# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'open-uri'

# clean up db
Mentor.destroy_all
User.destroy_all
Topic.destroy_all
MentorTopic.destroy_all
Industry.destroy_all
p "Finished cleaning the database"

# seeding industries
industries = ['Agriculture', 'Arts, Entertainment and Recreation', 'Construction', 'Educational Services', 'Healthcare', 'Manufacturing', 'Transportation']
industries.each do |industry|
    Industry.create(industry_name: industry)
    p "Created #{industry}"
end

# seeding users
array = []

20.times {
    user = User.new(name: Faker::Name.name,
    location: Faker::Address.country,
    industry_id: Industry.where(industry_name: industries.sample).first.id,
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    education: Faker::Educator.degree,
    experience_years: Faker::Number.between(from: 1, to: 10),
    job_title: Faker::Job.title,
    email: Faker::Internet.email,
    password: Faker::Internet.password,)
    file = URI.open("https://kitt.lewagon.com/placeholder/users/random")
    user.photo.attach(io: file, filename: 'avatar.png')
    user.save!
    p "Created #{user.name}"
    array << user
    p "Added user to array"
}



# seeding Mentors
user_array = array.sample(15)

user_array.each do |user|
    mentor = Mentor.new(user_id: user.id, hourly_rate: Faker::Number.between(from: 20, to: 100))
    mentor.save!
    p "Created mentor"
end

# seeding Topics
Topic.create(name: 'General')
Topic.create(name: 'Work culture')
Topic.create(name: 'Technical Questions')
Topic.create(name: 'Learning')
p "Created all topics"
