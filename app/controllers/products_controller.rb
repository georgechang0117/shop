class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.all
    @cart = Cart.from_hash(session[:cart])
  end
end
