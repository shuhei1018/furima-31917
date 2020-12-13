require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品' do
    context '商品出品ができるとき' do
      it 'imageとnameとexplanationとcategory_idとstatus_idとdelivery_burden_idとdelivery_area_idとdelivery_date_idとpriceが存在すれば登録できること' do
        expect(@item).to be_valid
      end
      
    end

    context '商品出品ができないとき' do
      
    end
  end
end