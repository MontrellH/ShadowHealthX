class DogsController < ApplicationController
  before_action :authenticate_user!, except: [:new, :show, :index, :create]
  before_action :set_dog, except: [:create, :new, :index]
  before_action :authorize!, except: [:new, :create, :show, :index]

  def index
    set_dog_bg
    @dogs = Dog.all
  end

  def new
    set_dog_bg
    @dog = Dog.new
  end

  def show
    set_dog_bg
    set_dog
    user_id = @dog.user_id
    @user = User.find_by_id(user_id)
    if(@user.shelter_id != nil)
      shelter_id = @user.shelter_id
      @shelter = Shelter.find_by_id(shelter_id)
    else
    end
  end

  def edit
    set_dog_bg
  end

  def create
      set_dog_bg
      @dog = Dog.new(dog_params)
      @dog.user = current_user
      if @dog.save!
        redirect_to dogs_path
      else
        render new_dog_path
    end
  end

  def update
    set_dog_bg
    if @dog.update(dog_params)
      redirect_to @dog
    else
      render edit_dog_path
    end
  end

  def destroy
    set_dog_bg
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

  def set_dog_bg
    @dogbg = true
  end

end
