class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postalcode, :prefecture_id, :municipality, :house_number, :building_name, :phonenumber, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :postalcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality
    validates :house_number
    validates :phonenumber, format: { with: /\A\d{11}\z/, message: 'Input only number' }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postalcode: postalcode, prefecture_id: prefecture_id, municipality: municipality, house_number: house_number, building_name: building_name, phonenumber: phonenumber, purchase_id: purchase.id)
  end
end
