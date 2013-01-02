class Template < ActiveRecord::Base
	belongs_to :account
	has_many :phases
	has_many :comments, :as => :commentable

	def creator
		User.find_by_id(self.created_by)
	end

end
