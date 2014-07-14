class UsersController < ApplicationController
	before_filter :authenticate_user!

    def index
    	@topics = Topic.visible_to(current_user).paginate(page: params[:page], per_page: 10)
    end
    
	def update
		if current_user.update_attributes(user_params)
			flash[:notice] = "User information updated"
			redirect_to edit_user_registration_path(current_user)
		else
			render "devise/registrations/edit"
		end
	end

	private
	def user_params
      params.require(:user).permit(:name, :avatar, :email_favorites )
    end
end
