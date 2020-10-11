class ChangeUserDataTypeAccess < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      t.change :access, :string, default: ""
    end
  end
end
