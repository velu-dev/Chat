class ChangeColumnToUser < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
   t.change :mobile,:string
  end
  end
end
