class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.string :type
      t.integer :amount
      t.integer :created_by
      t.integer :account_id

		t.references :budgetable, :polymorphic => true

      t.timestamps
    end
  end
end
