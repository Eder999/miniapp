class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :name
      t.string :description
      t.boolean :private, default: false
      t.references :user, null: false
      t.timestamps
    end
  end
end
