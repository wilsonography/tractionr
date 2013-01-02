class Deliverable < ActiveRecord::Base
	belongs_to :account
	belongs_to :phase
	has_many :tasks, :as => :taskable, :dependent => :destroy
	has_many :attachments, :as => :attachable
	has_many :comments, :as => :commentable
			
	def creator
		User.find_by_id(self.created_by)
	end
	
	def budget
		if self.tasks.count > 0
			budget = 0
			self.tasks.each do |t|
				budget += t.budget
			end
			return budget
		end
	end
	
	def complete?
		if self.tasks.count > 0
			all_true = self.tasks.count(:conditions => [ 'completed = ?', true ]) == self.tasks.count
			return all_true
		else
			return false
		end
	end

end
