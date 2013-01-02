class Phase < ActiveRecord::Base

	belongs_to :account
	belongs_to :project
	belongs_to :template
	has_many :attachments, :as => :attachable
	has_many :deliverables, :dependent => :destroy
	has_many :comments, :as => :commentable
	
	def creator
		User.find_by_id(self.created_by)
	end
	
	def budget
	   total_budget = 0
		@deliverables = Deliverable.find_all_by_phase_id(self.id)
		@deliverables.each do |d|
			d.tasks.each do |t|
				total_budget += t.budget
			end
		end
		return total_budget
	end

end
