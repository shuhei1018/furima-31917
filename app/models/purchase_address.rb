class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postalcode, :prefecture, :municipality, :house_number, :building_name, :phonenumber

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end

  validates :prefecture, numericality: { other_than: 1, message: "can't be blank" }
  validates :municipality, :house_number, presence: true

  def save
    Purchase.create(user_id: user.id, item_id: item.id)
    Address.create(postalcode: postalcode, prefecture: prefecture, municipality: municipality, house_number: house_number, building_name: building_name, phonenumber: phonenumber, purchase: purchase)
  end

end

# | Column | Type       | Options                                      |
# | ------ | ---------- | -------------------------------------------- |
# | item   | references | null: false, unique: true, foreign_key: true |
# | user   | references | null: false, unique: true, foreign_key: true |

# | Column        | Type      | Options                        |
# | ------------- | --------- | ------------------------------ |
# | postalcode    | string    | null: false                    |
# | prefecture_id | integer   | null: false                    |
# | municipality  | string    | null: false                    |
# | house_number  | string    | null: false                    |
# | building_name | string    |                                |
# | phonenumber   | string    | null: false, unique: true      |
# | purchase      | reference | null: false, foreign_key: true |