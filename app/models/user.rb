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




     def badges_check(current_user)
        one_mixtape(current_user)
    end



     def one_mixtape(current_user)
        if !current_user.badges.include?(Badge.find(15))
            if current_user.mixtapes.count >= 1
                BadgeUser.create(badge_id: 15, user_id: current_user.id)
                puts "-------------------------------"
                puts "BadgeUser Created"
                puts "-------------------------------"
                true
           end
        end
    end
end
