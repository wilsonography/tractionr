class AddRoleToUser < ActiveRecord::Migration
  def change
    add_column :users, :role, :string

    add_column :users, :created_by, :integer

    add_column :users, :account_id, :integer

    add_column :users, :company_id, :integer

    add_column :users, :phone, :string

  end
end
