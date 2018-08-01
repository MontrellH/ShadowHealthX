class SheltersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :show, :index, :create]
  before_action :set_shelter, except: [:create, :new, :index]
  before_action :authorize!, except: [:new, :create, :show, :index]

  def index
    @shelters = Shelter.all
  end

  def new
    @shelter = Shelter.new
  end

  def show

  end

  def edit

  end

  def create
    @shelter = Shelter.new(shelter_params)
      if @shelter.save!
        redirect_to '/shelters'
      else
        render 'new'
      end
  end

  def update
    if @shelter.update(shelter_params)
      redirect_to @shelter
    else
      render 'edit'
    end
  end

   def show
     @shelter = Shelter.find(params[:id])
     @dogs = @shelter.dogs
   end
   
  def destroy
    @shelter.destroy
    redirect_to '/shelters'
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

end
