require 'rspotify'

class SongsController < ApplicationController

    before_action :authenticate, only: [:found, :search, :albums, :songs]
    before_action :get_current_user

def search
   @artists = flash[:artists]
   flash[:mixtape_id] = params[:id]
end

def found
    flash[:mixtape_id] = flash[:mixtape_id]
    if !params[:artist_name].empty?
     @artists = RSpotify::Artist.search(params[:artist_name])
     
   else
     redirect_to search_path
   end
end


def albums
    flash[:mixtape_id] = flash[:mixtape_id]
     @artist = RSpotify::Artist.find(params[:id])

end

def songs
    
    flash[:mixtape_id] = flash[:mixtape_id]

     @album = RSpotify::Album.find(params[:id])
    
end

def add_song

    new_song = Song.create(song_id: params[:song_id] , name: params[:name]  , preview_url: params[:preview_url], artist_name: params[:artist_name], album: params[:album], artist_url: params[:artist_url], album_url: params[:album_url])
    ##findby or create here

    MixtapeSong.create(mixtape_id: flash[:mixtape_id], song_id: new_song.id)

    redirect_to edit_mixtape_path(flash[:mixtape_id])
end





private


    def get_current_user
        @current_user = current_user
    end

    def authenticate
        RSpotify.authenticate("","")
    end

end