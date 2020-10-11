class ChangeTaskDayType < ActiveRecord::Migration[6.0]
  def change
    change_table :tasks do |t|
      t.change :day, :string, default: ""
    end
  end
end
