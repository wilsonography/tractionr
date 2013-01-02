class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :availability, :integer
    add_column :tasks, :priority, :integer
	 
  end
end
