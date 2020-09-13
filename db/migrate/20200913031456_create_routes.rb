class CreateRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :routes do |t|
      t.integer :year
      t.string :bus
      t.string :gas
      t.string :helper
      t.string :helper_b
      t.string :km
      t.integer :mes
      t.datetime :start
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
