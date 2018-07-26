class DogsController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index
    @dogs = Dog.all
  end

  def new
    @dog = Dog.new
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def edit
    @dog = Dog.find(params[:id])
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
    @dog = Dog.find(params[:id])

    if @dog.update(dog_params)
      redirect_to @dog
    else
      render 'edit'
    end
  end

  def destroy
    @dog = Dog.find(params[:id])
    @dog.destroy

    redirect_to '/dogs'
  end

    private
      def dog_params
        params.require(:dog).permit(:name, :breed, :description, :age)
    end
end
