FactoryBot.define do
  factory :item do
    name {Faker::Commerce.product_name}
    description {Faker::Lorem.sentence}
    image { Rack::Test::UploadedFile.new(Rails.root.join('app/assets/images/item-sample.png')) }
    category_id { rand(2..11) }
    condition_id { rand(2..7) }
    shipping_fee_id { rand(2..3) }
    prefecture_id { rand(2..48) }
    shipment_day_id { rand(2..4) }
    price { rand(300..9999999) }
    association :user
  end
end
