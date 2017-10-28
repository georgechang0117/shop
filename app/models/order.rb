class Order < ApplicationRecord
  has_many :order_items, :dependent => :destroy

  belongs_to :user

  has_associated_audits

  enum status: [ :ordered, :shipping, :shipped, :canceled ]

  def total_price
    order_items.reduce(0) { |sum, item| sum + item.price }
  end
end
