class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def add_product(product_id)
    current_item = self.line_items.find_by(product_id: product_id) # find_by returns one vs where returns an array
    if current_item
      current_item.quantity += 1
    else
      current_item = self.line_items.build(product_id: product_id)
    end
    current_item
  end
end
