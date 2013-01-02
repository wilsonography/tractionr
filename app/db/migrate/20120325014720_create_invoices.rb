class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :created_by
      t.integer :account_id

      t.timestamps
    end
  end
end
