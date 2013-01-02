class Account < ActiveRecord::Base

	has_many :invoices
	has_many :users
	has_many :companies
	has_many :templates
	has_many :projects
	has_many :line_items
	has_many :deliverables
	has_many :tasks
	has_many :invoices
	has_many :budgets
	has_many :comments
	has_many :phases
	has_many :attachments

	def owner
		User.find_by_id(self.owner_id)
	end

end
