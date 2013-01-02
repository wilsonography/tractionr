class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :description
      t.string :website
      t.integer :primary_contact_id
      t.integer :created_by
      t.integer :account_id

      t.timestamps
    end
  end
end
