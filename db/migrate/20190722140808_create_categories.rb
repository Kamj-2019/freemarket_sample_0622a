class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      # t.references :first_category, null: false
      # t.references :second_category, null: false
      # t.references :third_category, null: false
      t.timestamps
    end
  end
end
