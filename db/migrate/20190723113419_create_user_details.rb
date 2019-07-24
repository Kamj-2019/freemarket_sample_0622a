class CreateUserDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :user_details do |t|
      t.string :first_name, null: false
      t.string :family_name, null: false
      t.string :kana_first_name, null: false
      t.string :kana_family_name, null: false
      t.integer :birthday, null: false
      t.string :postalcode, null: false
      t.references :prefecture, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :building, null: false
      t.string :phone_number, null: false
      t.references :user, null: false
      t.timestamps
    end
  end
end
