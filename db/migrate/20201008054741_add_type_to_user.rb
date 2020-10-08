class AddTypeToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :type, :string
    add_column :users, :access, :integer, default: 0
  end
end
