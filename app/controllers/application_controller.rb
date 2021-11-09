class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?

  def logged_in?
    !session[:user_id].nil?
  end

  def current_user
    Customer.find_by(id: session[:user_id])
  end
end
