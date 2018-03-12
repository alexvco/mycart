class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  private

  # its important you set_cart (create a cart) only when a line_item is created/added,
  # otherwise you will create alot of empty carts because of users who visit products#index and bounce

  def set_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end
  
end
