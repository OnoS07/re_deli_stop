class UsersController < ApplicationController

	def top
	end

	def show
		@user = User.find(params[:id])
		@posts = @user.posts
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:notice] = "UPDATE YOUR PROFILE !"
			redirect_to user_path(@user)
		else
			render("users/edit")
		end
	end

	protected
	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
	end

end
