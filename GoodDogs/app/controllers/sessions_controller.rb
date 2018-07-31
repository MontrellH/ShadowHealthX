class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def create
        user = User.find_by(email:login_params[:email])
        if user && user.authenticate(login_params[:password])
            session[:user_id] = user.id
            redirect_to '/homepage'
        else
            flash[:login_errors] = ['invalid credentials']
            redirect_to '/'
        end
    end

    def destroy
        puts "Here"
        # User.find(session[:user_id]).destroy
        session[:user_id] = nil
        redirect_to '/'
    end

    private
        def login_params
            params.require(:login).permit(:email, :password)
        end
end
