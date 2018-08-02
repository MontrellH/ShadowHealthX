class DogsController < ApplicationController
  before_action :authenticate_user!, except: [:new, :show, :index, :create]
  before_action :set_dog, except: [:create, :new, :index]
  before_action :authorize!, except: [:new, :create, :show, :index]

  def index
    @dogs = Dog.all
  end

  def new
    @dog = Dog.new
  end

  def show
    set_dog
    user_id = @dog.user_id
    @user = User.find_by_id(user_id)
    shelter_id = @user.shelter_id
    @shelter = Shelter.find_by_id(shelter_id)
  end

  def edit

  end

  def create

      @dog = Dog.new(dog_params)
      @dog.user = current_user
      if @dog.save!
        redirect_to dogs_path
      else
        render new_dog_path
    end
  end

  def update
    if @dog.update(dog_params)
      redirect_to @dog
    else
      render edit_dog_path
    end
  end

  def destroy
    @dog.destroy
    redirect_to dogs_path
  end

  private
  def set_dog
      @dog = Dog.find(params[:id])
  end

  def authorize!
      unless @dog.user == current_user
        redirect_to users_path, alert: 'You are not authorized.' and return
      end
  end

  def dog_params
        params.require(:dog).permit(:name, :breed, :description, :age, :avatar, {avatars: []},:remove_avatars)
  end

end
