# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


100.times do 
	User.create!(
  	username: Faker::Internet.user_name,
  	first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
		city_time_zone: Faker::Address.time_zone,
    email: Faker::Internet.email,
    password: 'testing',
    password_confirmation: 'testing'
  ) 
	print "|".green
end

50.times do 
	Teaching.create!(
    country_of_origin: Faker::Address.country,
  	first_language: ["Chinese", "Japanese", "Korean", "Spanish", "Russian", "Portugese"].sample,
  	subject_to_teach: ["Chinese", "Japanese", "Korean", "Spanish", "Russian", "Portugese"].sample,
  	education: ["Masters", "Bachelor Degree", "PhD", "Other"].sample,
  	teacher_id: User.all.sample.id,
  	price_cents: rand(1000...4000)
    # price_currency: USD
	)
	print "|".yellow
end

# 100.times do
# 	Booking.create!(
# 	  # time: Faker::Date.forward(10),
# 	  description: Faker::Lorem.paragraph,
# 	  student_id: User.all.sample.id,
# 	)
# 	print "|".yellow
# end
