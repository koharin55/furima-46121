class OrderAddress
  include ActiveModel::Model
  attr_accessor :zip, :prefecture_id, :city, :address, :building_name, :phone, :order, :item, :user_id

  with_options presence: true do
    validates :zip, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}# 1以上、1000000以下の整数を許可する
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :city
    validates :address
    validates :phone, format: {with: /\A\d{10,11}\z/, message: "is invalid. Input only number"}
    validates :order
    validates :item
    validates :user    
  end  

  def save
    order = Order.create(item: item, user_id: user_id)
    Address.create(zip: zip, prefecture_id: prefecture_id, city: city, addres: address, building_name: building_name, phone: phone, order_id: order.id)
  end
end