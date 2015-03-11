# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
create_table "bookings", force: :cascade do |t|
    t.datetime "time"
    t.text     "description"
    t.string   "student_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "teaching_id"
  end

  create_table "teachings", force: :cascade do |t|
    t.string   "country_of_origin"
    t.string   "first_language"
    t.string   "subject_to_teach"
    t.string   "education"
    t.integer  "teacher_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                           null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "city_time_zone"
  end

200.times do 
	User.create!(
  	user_name: Faker::Internet.user_name,
  	first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "cats"
  ) 
  end

150.times do 
	StudentAccount.create!(
		city_time_zone: Faker::Address.time_zone,
    s_introduction: Faker::Lorem.paragraph,
    subject_of_study: ["Chinese", "Japanese", "Korean", "Spanish", "Russian", "Portugese"].sample,
    user_id: User.all.sample.id
		)
  end

50.times do 
	TeacherAccount.create!(
    country_of_origin: Faker::Address.country,
    city_time_zone: Faker::Address.time_zone,
    first_language: ["Chinese", "Japanese", "Korean", "Spanish", "Russian", "Portugese"].sample,
    subject_to_teach: ["Chinese", "Japanese", "Korean", "Spanish", "Russian", "Portugese"].sample,
    education: ["Masters", "Bachelor Degree", "PhD", "Other"].sample,
    t_introduction: Faker::Lorem.paragraph,
    user_id: User.all.sample.id
		)
  end

200.times do
	Booking.create!(
    time: Faker::Date.forward(10),
    description: Faker::Lorem.paragraph,
    student_id: Student.all.sample.id,
    teaching_id: Teaching.all.sample.id
		)
  end
