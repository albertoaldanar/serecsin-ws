class AddImagesToStop < ActiveRecord::Migration[6.0]
  def change
    add_column :stops, :images, :integer, array: true, default: []

  end
end
