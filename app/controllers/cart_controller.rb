class CartController < ApplicationController
  # POST /cart
  # Data sent as form data (params)
  def create
    # Adds params[:id] to cart
    # the logger will show in the rails server.. super useful for debugging!!
    logger.debug("Adding #{params[:id]} to cart.")
    id = params[:id].to_i
    session[:shopping_cart] << id # puts onto the array on the end!

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
end
