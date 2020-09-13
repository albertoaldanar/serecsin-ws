class AddDoneToRoute < ActiveRecord::Migration[6.0]
  def change
    add_column :routes, :done, :boolean
    add_column :routes, :lt_done, :string
  end
end
