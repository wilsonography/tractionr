class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :title
      t.string :description
      t.string :url
      t.integer :created_by
      t.integer :account_id
      
      t.references :attachable, :polymorphic => true

      t.timestamps
    end
  end
end
