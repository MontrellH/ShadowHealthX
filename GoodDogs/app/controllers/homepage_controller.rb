class HomepageController < ApplicationController
  def index
    @dogs = Dog.by_points
    @vote = Vote.where("user_id = ?", current_user )
  end

  def button

    @dog = Dog.find(params[:id])

    @vote = Vote.new
    @vote.user_id = current_user.id
    @vote.dog_id = @dog.id
    @vote.save!
    @dog.points += 1
    @dog.save!
    redirect_to homepage_index_path
  end
end
