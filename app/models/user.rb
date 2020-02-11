class User < ApplicationRecord
    has_secure_password 
    has_many :mixtapes
    has_many :badge_users
    has_many :badges, through: :badge_users
    has_many :songs, through: :users

    validates :user_name, presence: true
    validates :user_name, uniqueness: true
    validates :email, uniqueness: true
    validates :email, presence: true
    validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, :message => " - Example: user@gmail.com"

end
