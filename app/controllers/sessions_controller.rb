class SessionsController < ApplicationController
  def new
    @error = params[:error] if params[:error].present?
    puts "==========================================" + params[:error] unless params[:error].nil?
  end

  def create
    print params
    @customer = Customer.find_by(username: params[:username])

    if @customer && @customer.password == params[:password]   # customer.authenticate(params[:password])
      session[:user_id] = @customer.id
      redirect_to "/welcome"
    elsif !params[:username].present? || !params[:password].present?
      redirect_to login_path(error: "Please fill out the form!")
    else
      redirect_to login_path(error: "Customer not exist!")
    end
  end

  def login; end

  def destroy
    session.delete(:user_id)
    redirect_to "/welcome"
  end

  def welcome; end
end
