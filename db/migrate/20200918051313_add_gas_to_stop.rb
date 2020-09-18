class AddGasToStop < ActiveRecord::Migration[6.0]
  def change
    add_column :stops, :gas, :string
  end
end
