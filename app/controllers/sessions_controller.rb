class SessionsController < ApplicationController
    def new
        
    end
    def create
        chef = Chef.find_by(email: params[:session][:email].downcase)
        if chef && chef.authenticate(params[:session][:password])
            session[:chef_id] = chef.id # Storing the encrypted chef_id in the session hash
            flash[:sucess] = "You have successfully logged in"
            redirect_to chef # or chef_path(chef) chef's show page
        else
            # flash.now will display at the same page then disappear, flash will run http cyclely
            flash.now[:danger] = "There was something wrong with your login information"
            render 'new'
        end
    end
    def destroy
        session[:chef_id] = nil
        flash[:sucess] = "You have logged out"
        redirect_to root_path
    end
end