class ApplicationController < ActionController::Base
  before_action :initialize_session
  helper_method :cart
  helper_method :logged_in?, :current_user

  helper_method :return_provinces, :cms_pages, :return_categories

  def logged_in?
    !session[:user_id].nil?
  end

  def current_user
    Customer.find_by(id: session[:user_id])
  end

  def return_provinces
    Province.all
  end

  def return_categories
    Category.all
  end

  def cms_pages
    Page.all
  end

  def initialize_session
    # initialize
    session[:shopping_cart] ||= [] # empty array of product IDs
  end

  def cart
    # you can pass an array of ids, and you'll get back a collection!
    Product.find(session[:shopping_cart])
    # pass an array of product id's.. get a collection of products!
  end
end
