class CreateDeliverables < ActiveRecord::Migration
  def change
    create_table :deliverables do |t|
      t.datetime :due_date
      t.string :title
      t.string :description
      t.integer :created_by
      t.integer :phase_id
      t.integer :account_id

      t.timestamps
    end
  end
end
