class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string  :postalcode, null: false
      t.integer :prefecture_id, null: false
      t.string :municipality, null: false
      t.string :house_number, null: false
      t.string :building_name
      t.string :phonenumber, null: false
      t.references  :purchase, foreign_key: true
      t.timestamps
    end
  end
end