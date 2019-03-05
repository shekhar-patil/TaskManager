class ApplicationController < ActionController::Base
  include Pundit
  include SessionsHelper

  private
    def require_login
      unless logged_in?
        flash[:danger] = "Please Log In for this section."
        redirect_to new_login_url
      end
    end
end
