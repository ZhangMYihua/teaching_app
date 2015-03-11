class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :teachings
  has_many :bookings, foreign_key: :student_id

  validates :password, length: { minimum: 6 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true
  
end
