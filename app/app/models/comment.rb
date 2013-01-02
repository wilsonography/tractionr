class Comment < ActiveRecord::Base
	belongs_to :account
	has_many :comments
	belongs_to :commentable, :polymorphic => true

	def creator
		User.find_by_id(self.created_by)
	end

end
