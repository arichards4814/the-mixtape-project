class ApplicationController < ActionController::Base


def current_user
    if session[:user_id]
        @current_user = User.find(session[:user_id])
    end
end

def logged_in?
    current_user
end

def authorized
    redirect_to "/login" unless logged_in?
end




end
