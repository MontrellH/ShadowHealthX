class UsersController < ApplicationController
    def index
        @skip_header = true
        @skip_footer = true
        @root = true
    end

    def create
        city = params[:user][:sheltercity]
        if city == ""
            city = params[:user][:city]
            if city == ""
                user_create
            else
                shelter = Shelter.find_by(name:params[:shelter_name])
                params[:user][:shelter_id] = shelter.id
                user_create
            end
        else
            params[:user][:city] = params[:user][:sheltercity]
            shelter = Shelter.new(shelter_params)
            if shelter.save
                params[:user][:shelter_id] = shelter.id
                user_create
            else
                flash[:register_errors] = shelter.errors.full_messages
            end
        end
    end

    def user_create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to '/homepage'
        else
            flash[:register_errors] = user.errors.full_messages
        end
    end

    private
     def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation,:shelter_id)
     end

     def shelter_params
        params.require(:user).permit(:name, :address, :city)
     end
end
