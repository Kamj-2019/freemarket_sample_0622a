class CreateUsersItems < ActiveRecord::Migration[5.0]
  def change
    create_table :users_items do |t|
      # t.references :user, null: false, foreign_key: true
      # t.references :item, null: false, foreign_key: true
      #t.references :payjp, null: false, foreign_key: true
      t.timestamps
    end
  end
end
