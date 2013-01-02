class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.string :description
      t.integer :amount
      t.integer :quantity
      t.integer :invoice_id
      t.integer :created_by
      t.integer :account_id

      t.timestamps
    end
  end
end
