class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.references :list, null: false
      t.references :task
      t.boolean :closed, default: false
      t.timestamps
    end
  end
end
