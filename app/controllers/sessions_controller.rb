class SessionsController < ApplicationController
  def new; end

  def create
    @customer = Customer.find_by(username: params[:username])

    if @customer && @customer.authenticate(params[:password])
      session[:user_id] = @customer.id
      redirect_to "/welcome"
    else
      redirect_to "/login"
    end
  end

  def login; end

  def welcome; end
end
