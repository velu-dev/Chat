class AddFnameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :fname, :string
    add_column :users, :mobile, :integer
    add_column :users, :gender, :string
  end
end
