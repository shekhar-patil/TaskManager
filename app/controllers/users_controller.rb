class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.valid?
			@user.save
			redirect_to users_url
		else
			render new_user
		end
	end
	def destroy
		user = User.find(params[:id])

		user.destroy
		@users = User.all
		redirect_to users_url
	end

	private 

	def user_params
		params.require(:user).permit(:name)
	end
end
