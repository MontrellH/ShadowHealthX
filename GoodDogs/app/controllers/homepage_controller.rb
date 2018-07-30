class HomepageController < ApplicationController
  def index
    @dogs = Dog.by_points
  end

  def button
    @dog = Dog.find(params[:id])

    @dog.points += 1
    @dog.save!
    redirect_to homepage_index_path
  end
end
