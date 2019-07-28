class CreateSizesCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :sizes_categories do |t|
      t.references :size, null: false
      t.references :category, null: false
      t.timestamps
    end
  end
end
