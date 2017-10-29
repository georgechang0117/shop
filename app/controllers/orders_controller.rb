class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    cart = Cart.from_hash(session[:cart])
    if cart.items.count > 0
      order = Order.new
      order.user = current_user
      cart.items.each do |item|
        order.order_items.new(product_id: item.product_id, qty: item.qty, price: item.price)
      end
      order.save
      session[:cart] = nil
      redirect_to order_path(order.id)
    else
      redirect_to products_path, :flash => { :notice => "請先選擇商品" }
    end
  end

  def edit
    @order = Order.find(params[:id])
  end
end
