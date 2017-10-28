class CartsController < ApplicationController
  def show
    @cart = Cart.from_hash(session[:cart])
  end

  def add
    cart = Cart.from_hash(session[:cart])
    cart.add(params[:id])
    session[:cart] = cart.serialize

    redirect_to products_path, notice: "已加入購物車"
  end

  def destroy
    session[:cart] = nil
    redirect_to products_path, notice: "購物車已清空"
  end
end
