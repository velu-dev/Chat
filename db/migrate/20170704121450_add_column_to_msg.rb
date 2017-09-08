class AddColumnToMsg < ActiveRecord::Migration[5.1]
  def change
     add_column :msgs, :to_id, :integer
  end
end
