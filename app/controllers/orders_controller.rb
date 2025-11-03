class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :correct_user, only: [:index, :create]
  before_action :sold_item, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_shipment = OrderShipment.new
  end
  
  def create
    @order_shipment = OrderShipment.new(order_params)
    if @order_shipment.valid?
      pay_item
      @order_shipment.save
      return redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render 'index', status: :unprocessable_entity
    end
  end


  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_shipment).permit(:zip, :prefecture_id, :city, :address, :building_name, :phone, :item_id).merge(user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def correct_user
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def sold_item
    if @item.order.present?
      redirect_to root_path
    end
  end
end
