class CreatePhases < ActiveRecord::Migration
  def change
    create_table :phases do |t|
      t.string :title
      t.string :description
      t.integer :project_id
      t.integer :template_id
      t.integer :created_by
      t.integer :account_id

      t.timestamps
    end
  end
end
