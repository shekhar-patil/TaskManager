class SessionsController < ApplicationController
	def new
  	end

	def create
		user = User.find_by(email: params[:login][:email].downcase)

	# If user exist in DB run has_secure_password's .authenticate()
		if user && user.authenticate(params[:login][:password]) 
		  # Save the user.id in session cookie if password correct:
		  session[:user_id] = user.id.to_s
		  flash[:notice] = 'Successfully logged in!'
		  redirect_to root_path 
		else
		  # if email or password incorrect, re-render login page:
		  flash.now[:alert] = 'Incorrect credentials, try again.'
		  render :new
		end
	end

	def destroy
	    # remove saved user_id from the cookie:
	    session.delete(:user_id)
	    alert[:notice] = 'Logged out!'
	    redirect_to login_path 
  	end
end
