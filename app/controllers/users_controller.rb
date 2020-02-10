class UsersController < ActionController::Base

    def new
        @user = User.new
        @errors = flash[:errors]
    end

    def create
        @user = User.new(user_params)

        if @user.valid?
            @user.save
            redirect_to user_path(@user)
        else 
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:user_name, :password, :password_confirmation, :email, :current_badge)
    end
end
