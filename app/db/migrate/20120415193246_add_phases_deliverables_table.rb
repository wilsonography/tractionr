class AddPhasesDeliverablesTable < ActiveRecord::Migration
  def change
  	create_table :phases_deliverables do |t|
      t.integer :phase_id
      t.integer :deliverable_id
      t.timestamps
  	end
  	create_table :templates_phases do |t|
      t.integer :phase_id
      t.integer :template_id
      t.timestamps
  	end
  	create_table :templates_deliverables do |t|
      t.integer :deliverable_id
      t.integer :template_id
      t.timestamps
  	end
  	add_column :deliverables, :is_template, :integer
  	add_column :phases, :is_template, :integer
  end
end
