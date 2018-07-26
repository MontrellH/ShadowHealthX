class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def new
    @shelter = Shelter.new
  end

  def create
    @shelter = Shelter.new(shelter_params)
      if @shelter.save
        redirect_to '/shelters'
      else
        render 'new'
      end
    end

    private
      def shelter_params
        params.require(:shelter).permit(:id, :name, :address, :city)
      end
  # def show
  #   @shelter = Shelter.find(params[:id])
  # end
end
