class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?

  helper_method :return_provinces

  def logged_in?
    !session[:user_id].nil?
  end

  def current_user
    Customer.find_by(id: session[:user_id])
  end

  def return_provinces
    Province.all
  end
end
