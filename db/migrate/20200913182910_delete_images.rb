class DeleteImages < ActiveRecord::Migration[6.0]
  def change
    remove_column :stops, :images
  end
end
