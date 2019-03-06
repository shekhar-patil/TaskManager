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
			session[:user_id] = @user.id.to_s
			flash[:notice] = 'Account created successfully!'
			redirect_to root_url
		else
			flash.now[:alert] = @user.errors.full_messages.join(', ')
			render new_user_path
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
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end
end
