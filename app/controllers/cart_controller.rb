class CartController < ApplicationController
  # POST /cart
  # Data sent as form data (params)
  def create
    # Adds params[:id] to cart
    # the logger will show in the rails server.. super useful for debugging!!
    logger.debug("Adding #{params[:id]} to cart.")
    id = params[:id].to_i
    session[:shopping_cart] << id # puts onto the array on the end!
    session[:products_quantity][params[:id]] = 1
    product = Product.find(id)
    # one time message, once read, disappear
    flash[:notice] = "➕ #{product.name} added to cart!"

    redirect_to products_path
  end

  # DELETE /cart/:id
  def destroy
    # removes params[:id] from cart
    id = params[:id].to_i
    session[:shopping_cart].delete(id)
    product = Product.find(id)
    flash[:notice] = "- #{product.name} removed to cart!"
    redirect_to products_path
  end

  def index; end

  def change_quantity
    puts "=======================" + params[:product_id] + "add_or_minus: " + params[:add_or_minus]
    puts "=======================, before: " + session[:products_quantity][params[:product_id]].to_s
    if params[:add_or_minus] == "ADD"
      session[:products_quantity][params[:product_id]] += 1
    elsif session[:products_quantity][params[:product_id]] > 1
      session[:products_quantity][params[:product_id]] -= 1

    end

    puts "=======================" + params[:product_id] + ", after: " + session[:products_quantity][params[:product_id]].to_s
    redirect_to "/products_in_cart"
  end
end
