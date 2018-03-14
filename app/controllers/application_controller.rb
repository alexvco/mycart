class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  
  private

  # its important you set_cart (create a cart) only when a line_item is created/added,
  # otherwise you will create alot of empty carts because of users who visit products#index and bounce

  def set_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end

  def authenticate_user!
    unless User.find_by(id: session[:user_id])
      redirect_to login_url, notice: "Please log in"
    end
  end
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

end
