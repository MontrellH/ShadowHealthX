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

  end

  def edit

  end

  def create

      @dog = Dog.new(dog_params)
      @dog.user = current_user
      if @dog.save!
        redirect_to '/dogs'
      else
        render'new'
    end
  end

  def update


    if @dog.update(dog_params)
      redirect_to @dog
    else
      render 'edit'
    end
  end

  def destroy

    @dog.destroy

    redirect_to '/dogs'
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
        params.require(:dog).permit(:name, :breed, :description, :age)
  end

end
