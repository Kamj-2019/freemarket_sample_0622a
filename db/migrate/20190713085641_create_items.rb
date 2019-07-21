class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.text :item_title, null: false
      t.text :description, null: false
      # t.references :category_id, null: false, foreign_key: true
      # t.references :brand_id, null:false, foreign_key: true
      # t.references :status_id, null:false, foreign_key: true
      # t.references :delivery_fee_payer_id, null:false, foreign_key: true
      # t.references :delivery_method_id, null:false, foreign_key: true
      # t.references :prefecture_id, null:false, foreign_key: true
      # t.references :shipping_day_id, null:false, foreign_key: true
      t.integer :price, null:false
      # t.references :user_id, null:false, foreign_key: true
      t.timestamps
    end
  end
end
