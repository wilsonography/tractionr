class User < ActiveRecord::Base
	
	belongs_to :company
	belongs_to :account
	has_many :authorizations  
	has_many :tasks
	has_many :attachments, :as => :attachable
	  
	def account_owner
		self.account.owner_id == self.id?
	end
	
	def creator
		User.find_by_id(self.created_by)
	end
	
	def capacity
		work_time = Float
		work_time = 0.00
		self.tasks.each do |t|
			work_time += t.budget.amount
		end
		percentage = Float
		percentage = 0.00
		percentage = work_time / self.availability * 100
		
		return percentage
	end
  
end