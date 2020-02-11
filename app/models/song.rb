class Song < ApplicationRecord
    has_many :mixtape_songs
    has_many :mixtapes, through: :mixtape_songs





end