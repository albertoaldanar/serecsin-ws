class ChangeUserDataType < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      t.change :user_type, :string, default: ""
    end
  end
end


