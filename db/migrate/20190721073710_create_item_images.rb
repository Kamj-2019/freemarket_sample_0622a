class CreateItemImages < ActiveRecord::Migration[5.0]
  def change
    create_table :item_images do |t|
      t.string :image_url, null: false
      t.references :item, null: false, foreign_key: true
      t.timestamps
    end
  end
end
