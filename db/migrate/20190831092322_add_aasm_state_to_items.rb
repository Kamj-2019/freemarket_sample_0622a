class AddAasmStateToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :aasm_state, :string
  end
end
