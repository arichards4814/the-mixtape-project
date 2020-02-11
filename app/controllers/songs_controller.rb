require 'rspotify'

class SongsController < ApplicationController

    before_action :authenticate, only: [:found, :search, :albums]
    before_action :get_current_user

def search
    
   @artists = flash[:artists]
   
end

def found

    if !params[:artist_name].empty?
     @artists = RSpotify::Artist.search(params[:artist_name])
     
   else
     redirect_to search_path
   end
end


def albums

     @artist = RSpotify::Artist.find(params[:id])

end

def songs


     @album = RSpotify::Album.find(params[:id])

end





private


    def get_current_user
        @current_user = current_user
    end

    def authenticate
        RSpotify.authenticate("45935d113e3d4f9a9e8c59ac455ccd0e","57d0101195234b9e84b4e9946d5af3ba")
    end

end