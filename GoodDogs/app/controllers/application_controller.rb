class ApplicationController < ActionController::Base
  def current_user
    if session[:user_id]
      return User.find(session[:user_id])
    else
      nil
    end
  end

  private

    def authenticate_user!
      unless current_user
      flash[:error] = "Please sign in."
      redirect_to users_path and return
    end
  end

end
