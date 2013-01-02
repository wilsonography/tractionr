class Project < ActiveRecord::Base
	belongs_to :account
	belongs_to :company
	has_many :invoices, :as => :invoiceable
	has_many :tasks, :as => :taskable
	has_many :comments, :as => :commentable
	has_many :attachments, :as => :attachable
	has_many :phases
	
	accepts_nested_attributes_for :attachments
		
	def creator
		User.find_by_id(self.created_by)
	end
	
	def time_assigned
	   total_budget = 0
	   self.phases.each do |p|
			p.deliverables.each do |d|
				d.tasks.each do |t|
					total_budget += t.budget
				end
			end
		end
		return total_budget
	end
	
	def time_billed
	   total_budget = 0
	   self.phases.each do |p|
			p.deliverables.each do |d|
				d.tasks.each do |t|
					t.completed? ? total_budget += t.budget : ''
				end
			end
		end
		return total_budget
	end
	
	def over_budget?
		if self.time_assigned > self.budget || self.time_billed > self.budget
			return true
		end
	end
	
	def deliverables
		return Deliverable.joins(:phase).where(:phases => {:project_id => self.id})
	end
	
	def tasks
		tasks = []
		self.deliverables.each do |d|
			d.tasks.each do |t|
				tasks << t
			end
		end
		return tasks
	end
	
	def due_dates
		dates = []	
		self.tasks.each do |t|
			dates << t.due_date
		end
		return dates
	end
	
end
