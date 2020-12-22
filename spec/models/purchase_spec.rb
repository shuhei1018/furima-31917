require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @purchase_address  = FactoryBot.build(:purchase_address)
  end
  describe '商品購入' do
    context '商品購入ができるとき' do
      it 'postalcodeとprefecture_idとmunicipalityとhouse_numberとbuilding_nameとphonenumberがあれば購入できる' do
        expect(@purchase_address).to be_valid
      end
    end
    
    context '商品購入ができないとき' do
      it '郵便番号が空の場合は購入できないこと' do
        @purchase_address.postalcode = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postalcode can't be blank")
      end
      it '郵便番号が"-"を含まない場合は購入できないこと' do
        @purchase_address.postalcode = "1234567"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postalcode is invalid. Include hyphen(-)")
      end
      it '郵便番号が"-前は３桁"でない場合は購入できないこと' do
        @purchase_address.postalcode = "12-4567"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postalcode is invalid. Include hyphen(-)")
      end
      it '郵便番号が"-後は4桁"でない場合は購入できないこと' do
        @purchase_address.postalcode = "123-456"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postalcode is invalid. Include hyphen(-)")
      end
      it '郵便番号が半角でない場合は購入できないこと' do
        @purchase_address.postalcode = "１２３−４５６７"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postalcode is invalid. Include hyphen(-)")
      end
      it '都道府県が未選択の場合は購入できないこと' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空の場合は購入ができないこと' do
        @purchase_address.municipality = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空の場合は購入ができないこと' do
        @purchase_address.house_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空の場合は購入ができないこと' do
        @purchase_address.phonenumber = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phonenumber can't be blank")
      end
      it '電話番号が半角数字でない場合は購入ができないこと' do
        @purchase_address.phonenumber = '０９０００００００００'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phonenumber Input only number")
      end
      it '電話番号が11桁でない場合は購入ができないこと' do
        @purchase_address.phonenumber = '0900000000'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phonenumber Input only number")
      end
    end
  end
end
