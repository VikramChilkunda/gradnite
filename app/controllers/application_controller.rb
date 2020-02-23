class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  add_flash_types :success, :danger, :info
  
  def current_user
    User.find_by(id: session[:user_id])
  end
end
