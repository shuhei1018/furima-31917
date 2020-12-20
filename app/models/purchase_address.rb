class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postalcode, :prefecture_id, :municipality, :house_number, :building_name, :phonenumber, :user_id, :item_id

  with_options presence: true do
    validates :postalcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  # validates :municipality, :house_number, presence: true

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postalcode: postalcode, prefecture_id: prefecture_id, municipality: municipality, house_number: house_number, building_name: building_name, phonenumber: phonenumber, purchase_id: purchase.id)
  end

end
