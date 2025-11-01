class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @order_shipment = OrderShipment.new
  end
  
  def create
    @order_shipment = OrderShipment.new(order_params)
    if @order_shipment.valid?
      @order_shipment.save
      return redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end


  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_shipment).permit(:zip, :prefecture_id, :city, :address, :building_name, :phone, :item_id).merge(user_id: current_user.id)
  end
end
