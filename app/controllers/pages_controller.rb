class PagesController < ApplicationController
    

    before_action :get_current_user
    before_action :authorized, except: [:main, :login, :create]
    before_action :badges_check

def main
    @notice = flash[:notice]

    
end

def login
    @error = flash[:error_message]
end

def create
    ## these nested needs to be checked
    @user = User.find_by(user_name: params[:user_name])
    
    if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to profile_path
    else 
        flash[:error_message] = "User name or password incorrect."
        redirect_to login_path
    end

end

def destroy
    session.delete(:user_id)
    session.delete(:spotify_user)
    flash[:notice] = "You have successfully logged out."
    redirect_to root_url
end

private


    def get_current_user
        @current_user = current_user
    end

    def badges_check
        if @current_user
            @new_badges = @current_user.badges_check(@current_user)
        end
    end


end
