class ApplicationController < ActionController::Base
  before_action :fetch_current_user

  def fetch_current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
