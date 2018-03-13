class Product < ApplicationRecord
  has_many :line_items
  has_many :orders, through: :line_items #this is useful for who_bought, where you can easily find out who (order) bought what products via line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  private

  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end
  
end
