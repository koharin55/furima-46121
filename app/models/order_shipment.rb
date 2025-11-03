class OrderShipment
  include ActiveModel::Model
  attr_accessor :zip, :prefecture_id, :city, :address, :building_name, :phone, :item_id, :user_id, :token

  with_options presence: true do
    validates :zip, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone, format: { with: /\A\d{10,11}\z/, message: "is invalid. Input only number" }
    validates :item_id
    validates :user_id
    validates :token
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
     ::Shipment.create(zip: zip, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone: phone, order_id: order.id)
  end
end
