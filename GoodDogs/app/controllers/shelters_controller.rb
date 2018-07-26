class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def new
    @shelter = Shelter.new
  end

  def destroy
    @shelter = Shelter.find(params[:id])
    @shelter.destroy
    redirect_to '/shelters'
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def create
    @shelter = Shelter.new(shelter_params)
      if @shelter.save
        redirect_to '/shelters'
      else
        render 'new'
      end
    end


   def show
     @shelter = Shelter.find(params[:id])
   end



   private
    def shelter_params
       params.require(:shelter).permit(:id, :name, :address, :city)
    end

end
