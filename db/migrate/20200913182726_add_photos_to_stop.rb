class AddPhotosToStop < ActiveRecord::Migration[6.0]
  def change
    add_column :stops, :photos, :text , array: true, default: []
  end
end
