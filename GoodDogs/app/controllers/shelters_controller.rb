class SheltersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :show, :index, :create]
  before_action :set_shelter, except: [:create, :new, :index]
  before_action :authorize!, except: [:new, :create, :show, :index]
  def index
    set_shelter_bg
    @shelters = Shelter.all
  end

  def new
    set_shelter_bg
    @shelter = Shelter.new
  end

  def show

  end

  def edit
    set_shelter_bg
  end

  def create
    set_shelter_bg
    @shelter = Shelter.new(shelter_params)
      if @shelter.save!
        redirect_to shelters_path
      else
        render new_shelter_path
      end
  end

  def update
    set_shelter_bg
    if @shelter.update(shelter_params)
      redirect_to @shelter
    else
      render edit_shelter_path
    end
  end

   def show
    set_shelter_bg
     @shelter = Shelter.find(params[:id])
     @dogs = @shelter.dogs
   end

  def destroy
    set_shelter_bg
    @shelter.destroy
    redirect_to shelters_path
  end

  private
  def set_shelter
      @shelter = Shelter.find(params[:id])
  end

  def authorize!
      unless @shelter.id == current_user.shelter_id
        redirect_to users_path, alert: 'You are not authorized.' and return
      end
  end

  def shelter_params
       params.require(:shelter).permit(:id, :name, :address, :city, :lat, :lng)
  end

  def set_shelter_bg
    @shelterbg = true
  end

end
