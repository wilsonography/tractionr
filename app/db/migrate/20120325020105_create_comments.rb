class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text
      t.integer :created_by
      t.integer :comment_parent_id
      t.integer :account_id
		
		t.references :commentable, :polymorphic => true
		
      t.timestamps
    end
  end
end
