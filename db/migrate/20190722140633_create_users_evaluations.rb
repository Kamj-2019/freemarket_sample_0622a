class CreateUsersEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :users_evaluations do |t|
      # t.references :evaluation, null: false
      # t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
