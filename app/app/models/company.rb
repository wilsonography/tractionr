class Company < ActiveRecord::Base
	
	belongs_to :account
	has_many :users
	has_many :attachments, :as => :attachable
	has_many :comments, :as => :commentable
	has_many :projects
	
	def primary_contact
		User.find_by_id(self.primary_contact_id)
	end
	
	def creator
		User.find_by_id(self.created_by)
	end

end
