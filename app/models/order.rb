class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy

  PAYMENT_TYPES = ["Check", "Credit card", "Purchase order"]

  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES

  def add_line_items_from_cart(cart)
    cart.line_items.each do |li|
      li.cart_id = nil # this is because when an order is created, we need to remove it from the cart, otherwise cart.line_items will always be increasing with items. 
      li.order_id = self.id # Basically we are transferring the line_item from being in the cart to being removed from the cart and now being part of an order
      li.save
    end
  end
end
