class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipment_day

  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}, presence: true
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}, numericality: { other_than: 1 , message: "can't be blank"}, presence: true
  validates :shipping_fee_id, numericality: { other_than: 1 , message: "can't be blank"}, presence: true
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}, presence: true
  validates :shipment_day_id, numericality: { other_than: 1 , message: "can't be blank"}, presence: true
  validates :price, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999,
    message: 'must be between 300 and 9,999,999'
  }, presence: true
end
