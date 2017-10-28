require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe "" do
    it "" do
      cart = Cart.new
      cart.add(1)
      expect(cart.empty?).to be false
    end

    it "如果加了相同種類的商品到購物車裡，購買項目（CartItem）並不會增加，但商品的數量會改變" do
      cart = Cart.new                             # 新增一台購物車
      3.times { cart.add(1) }                # 加了 3 次的 1
      5.times { cart.add(2) }                # 加了 5 次的 2
      2.times { cart.add(3) }                # 加了 2 次的 3

      expect(cart.items.length).to be 3           # 總共應該會有 3 個 item
      expect(cart.items.first.qty).to be 3   # 第 1 個 item 的數量會是 3
      expect(cart.items.second.qty).to be 5  # 第 2 個 item 的數量會是 5
    end
  end
end
