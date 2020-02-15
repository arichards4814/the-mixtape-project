class MixtapesController < ApplicationController

    
    before_action :get_current_user
    before_action :authorized
    before_action :badges_check
    before_action :find_mixtape, only: [:show, :edit, :update, :destroy, :like, :preview_send_mixtape, :send_mixtape, :spotify_add_playlist]
    before_action :authenticate, only: [:spotify_add_playlist]

def index
    @mixtapes = sorted
end

def show 
    @error = flash[:error]
    @success_message = flash[:success_message]
end

def new
    @mixtape = Mixtape.new
    @errors = flash[:errors]
end

def create
    @mixtape = Mixtape.new(mixtapes_params)
    ##need @mixtape.user = current_user
    if @mixtape.valid?
        @mixtape.save
        redirect_to edit_mixtape_path(@mixtape)
    else 
        flash[:errors] = @mixtape.errors.full_messages
        redirect_to new_mixtape_path
    end
end

def edit
    @errors = flash[:errors]
end

def update
    @mixtape.update(mixtapes_params)

    if @mixtape.valid?
        redirect_to mixtape_path(@mixtape)
    else 
        flash[:errors] = @mixtape.errors.full_messages
        redirect_to edit_mixtape_path
    end
end

def like
    Like.create(user_id: @current_user.id, mixtape_id: @mixtape.id)
    redirect_to mixtape_path(@mixtape)
end

def preview_send_mixtape
    @email_sent = flash[:email_sent]
end

def send_mixtape

    UserMailer.send_mixtape(@current_user, params[:recipient], @mixtape).deliver_now
    flash[:email_sent] = "Email Sent"
    redirect_to preview_send_mixtape_path
end

def destroy
    @mixtape.destroy
    redirect_to mixtapes_path
end

def spotify
        spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
        session[:spotify_user] = spotify_user.to_hash
        redirect_to spotify_landing_path
end

def spotify_add_playlist
    
    spotify_user = RSpotify::User.new(session[:spotify_user])

        if @mixtape.songs.length > 0 
            playlist = spotify_user.create_playlist!(@mixtape.title)
            s = []
            @mixtape.songs.each do |song|
            
                s << RSpotify::Track.find(song.song_id)
                
            end
            playlist.add_tracks!(s)
            flash[:success_message] = "You have successfully added this mixtape to your
            Spotify account as a playlist!"
            redirect_to mixtape_path(@mixtape)
        else
            flash[:error] = "This mixtape has no songs."
            redirect_to mixtape_path(@mixtape)
        end

        
end

def spotify_landing

end

private

def mixtapes_params
    params.require(:mixtape).permit(:title, :message, :cassette_url, :background_url, :user_id)
    #shoul get rid of user id here.. and take it out of the form.
end

def find_mixtape
    @mixtape = Mixtape.find(params[:id])
end

    def get_current_user
        @current_user = current_user
    end

    def badges_check
        if @current_user
            @new_badges = @current_user.badges_check(@current_user)
        end
    end

    def sorted
        @mixtapes = Mixtape.all
        @mixtapes.sort_by{|mixtape| mixtape.likes.count}.reverse
    end


    def authenticate
        spotify_key = ENV['spotify_api_key']
        spotify_secret = ENV['spotify_api_secret']

        RSpotify.authenticate(spotify_key,spotify_secret) 
    end

end
