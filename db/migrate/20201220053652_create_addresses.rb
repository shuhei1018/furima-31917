class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string  :postalcode
      t.integer :prefecture_id
      t.string :municipality
      t.string :house_number
      t.string :building_name
      t.string :phonenumber
      t.references  :purchase, foreign_key: true
      t.timestamps
    end
  end
end