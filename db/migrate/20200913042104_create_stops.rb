class CreateStops < ActiveRecord::Migration[6.0]
  def change
    create_table :stops do |t|
      t.datetime :arrived_at
      t.integer :year
      t.string :client
      t.string :comments
      t.string :contact
      t.string :email
      t.datetime :finished_at
      t.float :lat
      t.float :lng
      t.integer :mes
      t.string :phone
      t.references :route, null: false, foreign_key: true
      t.timestamps
    end
  end
end
