class Task < ActiveRecord::Base

	belongs_to :account
	belongs_to :user
	belongs_to :taskable, :polymorphic => true
	
	has_many :comments, :as => :commentable
	has_many :attachments, :as => :attachable
	has_many :tasks, :as => :taskable
	
	attr_accessor :day_span,:calendar_time, :time_scheduled
	attr_accessible :day_span,:calendar_time, :time_scheduled
	
	def creator
		User.find_by_id(self.created_by)
	end
		
	def priority_name
		case self.priority
			
		when 1
			return 'High'
			
		when 2
			return 'Medium'
			
		when 3
			return 'Low'
		end		
	end

	
end

