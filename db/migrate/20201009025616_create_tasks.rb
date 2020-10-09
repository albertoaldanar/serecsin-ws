class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :client
      t.date :day
      t.integer :order, default: 0
      t.boolean :done
      t.timestamps
    end
  end
end
