class ApplicationController < ActionController::Base
  include Pundit
  include SessionsHelper

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private
    def require_login
      unless logged_in?
        flash[:danger] = "Please Log In to view the Tasks."
        redirect_to new_login_url
      end
    end

    def user_not_authorized
      flash[:warning] = "You are not authorized to view any task."
      redirect_to(root_path)
    end
end
