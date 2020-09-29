class AddFailToStop < ActiveRecord::Migration[6.0]
  def change
    add_column :stops, :fail, :boolean
  end
end
