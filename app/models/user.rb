class User < ApplicationRecord
    has_secure_password 
    has_many :mixtapes
    has_many :badge_users
    has_many :badges, through: :badge_users
    has_many :songs, through: :users
    has_many :likes

    validates :user_name, presence: true
    validates :user_name, uniqueness: true
    validates :email, uniqueness: true
    validates :email, presence: true
    validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, :message => " - Example: user@gmail.com"




     def badges_check(current_user)
        ###NEED TO MAKE SURE ANYTHING ELSE RETURNS FALSE
        badges_created = []
        if classic_welcome(current_user)
             badges_created << BadgeUser.create(badge_id: 25, user_id: current_user.id)
        end
        if one_mixtape(current_user)
            badges_created << BadgeUser.create(badge_id: 15, user_id: current_user.id)
        end
        if vanilla_icecream(current_user)
            badges_created << BadgeUser.create(badge_id: 23, user_id: current_user.id)
        end
        if chocolate_icecream(current_user)
            badges_created << BadgeUser.create(badge_id: 2, user_id: current_user.id)
        end
        if strawberry_icecream(current_user)
            badges_created << BadgeUser.create(badge_id: 19, user_id: current_user.id)
        end
        if beef(current_user)
            badges_created << BadgeUser.create(badge_id: 1, user_id: current_user.id)
        end
        if the_big_five(current_user)
            badges_created << BadgeUser.create(badge_id: 9, user_id: current_user.id)
        end
        if the_big_ten(current_user)
            badges_created << BadgeUser.create(badge_id: 21, user_id: current_user.id)
        end
        if the_big_fifteen(current_user)
            badges_created << BadgeUser.create(badge_id: 8, user_id: current_user.id)
        end
        if the_lover(current_user)
            badges_created << BadgeUser.create(badge_id: 10, user_id: current_user.id)
        end
        if eighties(current_user)
            badges_created << BadgeUser.create(badge_id: 6, user_id: current_user.id)
        end
        if internet_god(current_user)
            badges_created << BadgeUser.create(badge_id: 14, user_id: current_user.id)
        end
        if lemonade(current_user)
            badges_created << BadgeUser.create(badge_id: 13, user_id: current_user.id)
        end
        badges_created
    end


    def classic_welcome(current_user)
        if !current_user.badges.include?(Badge.find(25))
            if current_user.mixtapes.count == 0
                true
           end
        end
    end


     def one_mixtape(current_user)
        if !current_user.badges.include?(Badge.find(15))
            if current_user.mixtapes.count >= 1
                true
           end
        end
    end

    def vanilla_icecream(current_user)
        if !current_user.badges.include?(Badge.find(23))
            current_user.mixtapes.each do |mixtape|
                if mixtape.likes
                    if mixtape.likes.length >= 5
                    true
                    end
                end
            end
            false
        end
    end
    def chocolate_icecream(current_user)
        if !current_user.badges.include?(Badge.find(2))
            current_user.mixtapes.each do |mixtape|
                if mixtape.likes
                    if mixtape.likes.length >= 10
                    true
                    end
                end
            end
            false
        end
    end
    def strawberry_icecream(current_user)
        if !current_user.badges.include?(Badge.find(19))
            current_user.mixtapes.each do |mixtape|
                if mixtape.likes
                    if mixtape.likes.length >= 15
                    true
                    end
                end
            end
            false
        end
    end
    def beef(current_user)
        if !current_user.badges.include?(Badge.find(1))
            current_user.mixtapes.each do |mixtape|
                if mixtape.likes
                   if mixtape.likes.length >= 50
                    true
                    end
                end
            end
            false
        end
    end
    def the_big_five(current_user)
        if !current_user.badges.include?(Badge.find(9))
           if current_user.mixtapes.count >= 5
                true
           end
        end
    end
    def the_big_ten(current_user)
        if !current_user.badges.include?(Badge.find(21))
           if current_user.mixtapes.count >= 10
                true
           end
        end
    end
    def the_big_fifteen(current_user)
        if !current_user.badges.include?(Badge.find(8))
           if current_user.mixtapes.count >= 15
                true
           end
        end
    end
    def the_lover(current_user)
        if !current_user.badges.include?(Badge.find(10))
           current_user.mixtapes.each do |mixtape|
                if mixtape.cassette_url == 'cassettes/valentine.png'
                    true
                end
            end
            false
        end
    end
    def eighties(current_user)
        if !current_user.badges.include?(Badge.find(6))
           current_user.mixtapes.each do |mixtape|
                if mixtape.cassette_url == 'cassettes/eighties.png'
                    true
                end
            end
            false
        end
    end
    def internet_god(current_user)
        cassette_styles = []
        if !current_user.badges.include?(Badge.find(14))
            current_user.mixtapes.each do |mixtape|
                if !cassette_styles.include?(mixtape.cassette_url)
                cassette_styles << mixtape.cassette_url
                end
            end
        end
            if cassette_styles.count == 12
                true
            end
    end
    def lemonade(current_user)
        if !current_user.badges.include?(Badge.find(13))
            current_user.mixtapes.each do |mixtape|
                mixtape.songs.each do |song|    
                    if song.artist_name == "Beyoncé" || "Beyonce"
                        true
                    end
                end
             end
            false
        end
    end



    def find_liked_mixtapes
        liked_tapes = []
        Like.all.each do |like|
            if like.user_id == self.id
                liked_tapes << Mixtape.find(like.mixtape_id)
            end
        end
        liked_tapes
    end
end
