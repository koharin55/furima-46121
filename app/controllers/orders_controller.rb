class OrdersController < ApplicationController
  def index
    @order_address = OrderAddress.new
  end
  
  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      return redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end


  private
  def order_params
    params.require(:order_address).permit(:zip, :prefecture_id, :city, :address, :building_name, :phone, :order, :item).merge(user_id: current_user.id)
  end
end
