class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.text :item_title, null: false
      t.text :description, null: false
      # t.references :category, null:false
      # t.references :size, null:false
      # t.references :brand, null:false
      # t.references :status, null:false
      # t.references :delivery_fee_payer, null:false
      # t.references :delivery_method, null:false
      # t.references :prefecture, null:false
      # t.references :shipping_day, null:false
      t.integer :price, null:false
      # t.references :user, null:false
      t.timestamps
    end
  end
end
