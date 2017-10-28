class OrderItemsController < ApplicationController
  before_action :authenticate_user!
  
  def new
  end

  def create
  end

  def edit
    @order_item = OrderItem.find(params[:id])
  end

  def update
    @order_item = OrderItem.find(params[:id])
    if @order_item.update(order_item_params)
      redirect_to edit_order_path(params[:order_id])
    else
      render 'edit'
    end
  end

  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy!
    redirect_to edit_order_path(params[:order_id])
  end

  private
  def order_item_params
    params.require(:order_item).permit(:qty)
  end
end
