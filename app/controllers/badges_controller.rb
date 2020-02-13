class BadgesController < ApplicationController

    before_action :authorized
    before_action :badges_check
    before_action :find_badge, only: [:show, :edit, :update]

    def index
        @badges = Badge.all
    end

    def show

    end

    def new
        @badge = Badge.new
    end

    def create
        @badge = Badge.new(badges_params)

        if @badge.valid?
            @badge.save
            redirect_to badge_path(@badge)
        else
            flash[:errors] = @badge.errors.full_messages
            redirect_to new_badge_path
        end
    end

    def edit
        
    end

    def update

    end

    private

    def badges_params
        params.require(:badge).permit(:image_url, :title, :description)
    end

    def find_badge
        @badge = Badge.find(params[:id])
    end

    def badges_check
        if @current_user
            @new_badges = @current_user.badges_check(@current_user)
        end
    end
end
