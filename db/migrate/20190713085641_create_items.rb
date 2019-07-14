class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.text :item_title, null: true
      t.text :description, null: true
      # t.references :category_id, null: true, foreign_key: true
      # t.references :size_id, null: true, foreign_key: true
      # t.references :brand_id, null: true, foreign_key: true
      # t.references :status_id, null: true, foreign_key: true
      # t.references :delivery_fee_payer_id, null: true, foreign_key: true
      # t.references :delivery_method_id, null: true, foreign_key: true
      # t.references :prefecture_id, null: true, foreign_key: true
      # t.references :shipping_day_id, null: true, foreign_key: true
      t.integer :price, null: true
      # t.references :user_id, null: true, foreign_key: true
      t.timestamps
    end
  end
end
