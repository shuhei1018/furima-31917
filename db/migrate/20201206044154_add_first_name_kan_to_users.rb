class AddFirstNameKanToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name_kan, :string
  end
end
