class HomepageController < ApplicationController
  def index
    @dogs = Dog.all
  end
end
