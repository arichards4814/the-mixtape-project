class PagesController < ActionController::Base

def main
    @notice = flash[:notice]
end

def login
    @user = User.new
    @error = flash[:error_message]
end

def create
    @user = User.find_by(user_name: params[:user][:user_name])
 
    if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to root_path
    else 
        flash[:error_message] = "User name or password incorrect."
        redirect_to login_path
    end

end

def destroy
    session.delete(:user_id)
    flash[:notice] = "You have successfully logged out."
    redirect_to root_url
end



end
