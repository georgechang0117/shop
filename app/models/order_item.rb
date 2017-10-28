class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  audited associated_with: :order

  validate :qty_greater_than_zero

  before_validation :calculate_price

  private
  def qty_greater_than_zero
    if qty.nil? || qty < 1
      errors.add(:qty, 'Must be greater than zero')
    end
  end

  def calculate_price
    self.price = product.price * qty
  end
end
