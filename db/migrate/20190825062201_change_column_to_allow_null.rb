class ChangeColumnToAllowNull < ActiveRecord::Migration[5.0]
  def up
    change_column :items, :size_id,:integer, null: true
    change_column :items, :brand_id,:integer, null: true
  end

  def down
    change_column :items, :size_id,:integer, null: false
    change_column :items, :brand_id,:integer, null: false
  end
end
