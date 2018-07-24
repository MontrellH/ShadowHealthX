class ShelterController < ApplicationController
  def index
    @all_shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:id]) 
  end
end
