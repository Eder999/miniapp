class ChangeNameOnLists < ActiveRecord::Migration[6.0]
  def change
    change_column :lists, :name, :string, null: false
  end
end
