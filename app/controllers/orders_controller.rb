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
    order = Order.new
    order.user = current_user
    cart.items.each do |item|
      order.order_items.new(product_id: item.product_id, qty: item.qty, price: item.price)
    end
    order.save
    session[:cart] = nil
    redirect_to order_path(order.id)
  end

  def edit
    @order = Order.find(params[:id])
  end
end
