class CheckoutController < ApplicationController
  def create
    # product_in_param = Product.find(params[:product_id])
    # puts product_in_param.id

    # Establish a connection with Stripe and then redirect the user to the payment screen.
    if cart.nil?
      redirect_to root_path
      nil
    end
    status_new = Status.find_or_create_by(name: "Pending")

    order = Order.new(total_tax_rate: get_total_tax_rate,
                      total_paid:     get_total)
    order.customer = current_user
    order.status = status_new

    if order.save
      puts "==============" + "New ORder created successfully."
    else
      print_errors(order.errors)
      redirect_to root_path
    end
    session_info = { payment_method_types: ["card"],
                     success_url:          checkout_success_url + "?session_id={CHECKOUT_SESSION_ID}",
                     cancel_url:           checkout_cancel_url,
                     mode:                 "payment",
                     line_items:           [],
                     automatic_tax:        {
                       enabled: true
                     } }

    cart.each do |product|
      session_info[:line_items].push({
                                       quantity:   session[:products_quantity][product.id.to_s],
                                       price_data: {
                                         currency:     "cad",
                                         unit_amount:  (product.price * 100).to_i,
                                         tax_behavior: "exclusive",
                                         product_data: {
                                           name: product.name
                                         }
                                       }
                                     })

      OrderProduct.create(order: order, product: product,
                          quantity: session[:products_quantity][product.id.to_s], price: product.price)
    end

    session[:order_id] = order.id
    print session_info
    @session = Stripe::Checkout::Session.create(session_info)

    respond_to do |format|
      format.js
    end
  end

  def success
    # stripe success_url +"?session_id={CHECKOUT_SESSION_ID}"
    # when stripe redirects back to server... it will append this session_id  through GET params!
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)

    puts "=========================================================================" + @session.amount_total.to_s
    puts "=========================================================================" + @session.total_details.amount_tax.to_s
    # found in the docs!
    puts "=========================================================================" + session[:order_id].to_s
    status_paid = Status.find_or_create_by(name: "Paid")
    order = Order.find(session[:order_id])
    order.status = status_paid
    order.total_paid = @session.amount_total.to_f / 100
    order.save
  end

  def cancel
    # Something went wrong with the payment :(
  end
end
