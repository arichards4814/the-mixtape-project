class MixtapesController < ApplicationController

    
    before_action :get_current_user
    before_action :authorized
    before_action :find_mixtape, only: [:show, :edit, :update, :destroy]
    before_action :badges_check

def index
    @mixtapes = Mixtape.all
end

def show 

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

def destroy
    @mixtape.destroy
    redirect_to mixtapes_path
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

end
