class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.datetime :due_date
      t.string :title
      t.string :description
      t.integer :created_by
      t.integer :account_id

		t.references :taskable, :polymorphic => true
		
      t.timestamps
    end
  end
end
