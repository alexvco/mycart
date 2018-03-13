class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  belongs_to :order, optional: true # Rails 5 adds validation to belongs_to inherently, we want to put the order_id of the line_item when we create an order, not when we create a line item

  def line_item_total
    self.product.price * self.quantity
  end
end
