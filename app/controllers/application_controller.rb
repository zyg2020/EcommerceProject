class ApplicationController < ActionController::Base
  before_action :initialize_session
  helper_method :cart, :get_total
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
    session[:products_quantity] ||= {}
  end

  def cart
    # you can pass an array of ids, and you'll get back a collection!
    Product.find(session[:shopping_cart])
    # pass an array of product id's.. get a collection of products!
  end

  def get_total
    subtotal = cart.reduce(0) do |sum, product|
      sum + product.price * session[:products_quantity][product.id.to_s]
    end
    tax = 0

    tax += current_user.province.HST * subtotal if current_user.province.HST.present?
    tax += current_user.province.GST * subtotal if current_user.province.GST.present?
    tax += current_user.province.PST * subtotal if current_user.province.PST.present?

    subtotal + tax
  end
end
