class ShelterManipulationsController < ApplicationController
    def index
        puts params
        @shelters = Shelter.where(city:params[:city])      
        render json: @shelters
    end
end