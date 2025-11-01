require 'rails_helper'

RSpec.describe OrderShipment, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_shipment = FactoryBot.build(:order_shipment, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_shipment).to be_valid
      end

      it '建物名が空でも保存できること' do
        @order_shipment.building_name = ''
        expect(@order_shipment).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it '郵便番号が空だと保存できないこと' do
        @order_shipment.zip = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Zip can't be blank")
      end

      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @order_shipment.zip = '1234567'
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Zip is invalid. Include hyphen(-)")
      end

      it '都道府県が「---」だと保存できないこと' do
        @order_shipment.prefecture_id = 1
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が空だと保存できないこと' do
        @order_shipment.city = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空だと保存できないこと' do
        @order_shipment.address = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空だと保存できないこと' do
        @order_shipment.phone = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Phone can't be blank")
      end

      it '電話番号は、10桁か11桁の半角数値のみ保存可能なこと' do
        @order_shipment.phone = '090-1234-5678'
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Phone is invalid. Input only number")
      end

      it 'item_idが空だと保存できないこと' do
        @order_shipment.item_id = nil
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Item can't be blank")
      end

      it 'user_idが空だと保存できないこと' do
        @order_shipment.user_id = nil
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end