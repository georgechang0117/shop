class Cart
  attr_reader :items
  
  def initialize(items = [])
    @items = items
  end

  def add(product_id)
    car_item = items.find {|i| i.product_id == product_id }

    if car_item
      car_item.increase
    else
      @items << CartItem.new(product_id)
    end
    
  end

  def empty?
    @items.empty?
  end

  def total_price
    items.reduce(0) { |sum, item| sum + item.price }
  end

  def serialize
    all_items = items.map { |item|
      { "product_id" => item.product_id, "qty" => item.qty}
    }

    { "items" => all_items }
  end

  def self.from_hash(hash)
    if hash.nil?
      new []
    else
      new hash["items"].map { |item_hash|
        CartItem.new(item_hash["product_id"], item_hash["qty"])
      }
    end
  end
end