class UsersController < ApplicationController


    before_action :get_current_user
    before_action :authorized, except: [:new, :create]
    before_action :badges_check
    before_action :find_user, only: [:show, :edit, :update, :destroy]
    

    def new
        @user = User.new
        @errors = flash[:errors]
    end

    def create
        @user = User.new(user_params)

        if @user.valid?
            @user.update(current_badge: "badges/b_and_w_default.png")
            @user.save
            UserMailer.welcome_email(@user).deliver_now
            session[:user_id] = @user.id
            redirect_to profile_path
        else 
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end

    def show

        ## made current_user in the application controller
        ## @user = current_user
    end

    def profile
        @current_user = current_user
        @current_user_sorted = sorted
    end

    def badges
        @current_user = current_user

    end

    def change_badge

        @current_user = current_user
        badge = Badge.find(badge_params)
        @current_user.current_badge = badge.image_url
        @current_user.save
        
        redirect_to profile_badges_path
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

    def loved
        @liked_tapes = @current_user.find_liked_mixtapes
        
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

    def badge_params
        params.require(:id)
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
        @current_user.mixtapes.sort_by{|mixtape| mixtape.likes.count }.reverse
    end

end
