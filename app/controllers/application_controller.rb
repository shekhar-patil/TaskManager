class ApplicationController < ActionController::Base
  include Pundit
  include SessionsHelper

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private
    def require_login
      unless logged_in?
        flash[:danger] = "Please Log In to view the Tasks."
        redirect_to new_login_path
      end
    end

    def logged_in?
      !current_user.nil?
    end
  
    def current_user
      if session[:user_id]
        @current_user ||= User.find(session[:user_id])
      end
    end

    def user_not_authorized
      flash[:warning] = "All accesssable tasks are listed below."
      redirect_to root_path
    end
end
