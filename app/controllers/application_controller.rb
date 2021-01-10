class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :require_user_logged_in

  include SessionsHelper

  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
end
