class Invoice < ActiveRecord::Base

	has_many :line_items
	belongs_to :invoiceable, :polymorphic => true

end
