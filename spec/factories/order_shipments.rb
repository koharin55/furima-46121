FactoryBot.define do
  factory :order_shipment do
    zip { "123-4567" }
    prefecture_id { rand(2..48) }
    city { "横浜市緑区" }
    address { "青山1-1-1" }
    building_name { "柳ビル103" }
    phone { "09012345678" }
    token { "tok_abcdefghijk00000000000000000" }
  end
end
