class MixtapesController < ActionController::Base

    before_action :find_mixtape, only: [:show, :edit, :update, :destroy]

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

    if @mixtape.valid?
        @mixtape.save
        redirect_to mixtape_path(@mixtape)
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
end

def find_mixtape
    @mixtape = Mixtape.find(params[:id])
end

end
