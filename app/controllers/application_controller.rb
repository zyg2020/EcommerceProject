class ApplicationController < ActionController::Base
  # before_action :authenticate_user!

  helper_method :return_provinces

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :manipulate_params

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:first_name, :last_name, :address, :city, :province, :postal_code, :telephone, :country,
               :email, :password, :password_confirmation)
      logger.debug("asaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      # u[:province] = u[:province].to_i
      puts u[:province]
      logger.debug("asaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:first_name, :last_name, :address, :city, :province, :postal_code, :telephone, :country,
               :email, :password, :current_password)
    end
  end

  def return_provinces
    Province.all
  end

  def manipulate_params
    puts "asaaaaaaaaaaaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaaaaaaaa"
    logger.debug("asaaaaaaaaaaaaaaaasaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
    # params[:province] = 1
  end
end
