require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品' do
    context '商品出品ができるとき' do
      it 'imageとnameとexplanationとcategory_idとstatus_idとdelivery_burden_idとdelivery_area_idとdelivery_date_idとpriceが存在すれば出品できること' do
        expect(@item).to be_valid
      end
      it 'priceが300円以上であれば出品できること' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it 'priceが9999999円以下であれば出品できること' do
        @item.price = 9_999_999
        expect(@item).to be_valid
      end
    end

    context '商品出品ができないとき' do
      it '出品画像が空の場合出品ができないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空の場合出品ができないこと' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品説明が空の場合出品ができないこと' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーが未選択の場合出品ができないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'ステータスが未選択の場合出品ができないこと' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end
      it '配送料負担が未選択の場合出品ができないこと' do
        @item.delivery_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery burden must be other than 1')
      end
      it '配送元地域が未選択の場合出品ができないこと' do
        @item.delivery_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery area must be other than 1')
      end
      it '配送日数が未選択の場合出品ができないこと' do
        @item.delivery_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery date must be other than 1')
      end
      it '販売価格が空の場合出品ができないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
      it '販売価格が299円以下の場合出品ができないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '販売価格が10000000円以上の場合出品ができないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '販売価格が半角数字以外の場合出品ができないこと' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
