class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :email
      t.integer :owner_id
		
      t.timestamps
    end
  end
end
