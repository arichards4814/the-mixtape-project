class UsersController < ApplicationController

    before_action :authorized, except: [:new]
    before_action :find_user, only: [:show, :edit, :update, :destroy]

    def new
        @user = User.new
        @errors = flash[:errors]
    end

    def create
        @user = User.new(user_params)

        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end

    def show

        ## made current_user in the application controller
        ## @user = current_user
    end

    def edit
        @errors = flash[:errors]
    end

    def update
        @user.update(user_params)

        if @user.valid?
            @user.save
            redirect_to user_path(@user)
        else 
            flash[:errors] = @user.errors.full_messages
            redirect_to edit_user_path
        end

    end

    def destroy
        @user.destroy
        redirect_to root_path
    end

    private

    def user_params
        params.require(:user).permit(:user_name, :password, :password_confirmation, :email, :current_badge)
    end

    def find_user
        @user = User.find(params[:id])
    end
end
