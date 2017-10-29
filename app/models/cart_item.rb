class CartItem
  attr_reader :product_id, :qty

  def initialize(product_id, qty = 1)
    Product.find(product_id)
    @product_id = product_id
    @qty = qty
  end

  def increase(qty = 1)
    @qty += qty
  end

  def product
    Product.find(@product_id)
  end

  def price
    product.price * qty
  end
end