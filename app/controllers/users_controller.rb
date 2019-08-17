class UsersController < ApplicationController
def show
	if user_signed_in?
@user = User.find(params[:id])
	else
		redirect_to new_user_session_path
	end
end
def edit
end
def update
	if current_user.update(
		first_name: params[:first_name],
		last_name: params[:last_name],
		description: params[:description])
		flash[:success] = "success update"
	
		render 'show'
	else
		flash[:danger] = "Update error"
		render 'edit'
	end
end
end


