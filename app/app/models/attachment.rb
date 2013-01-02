class Attachment < ActiveRecord::Base
	
	mount_uploader :attachment, AttachmentUploader
	
	validates_presence_of :attachment

	belongs_to :account
	belongs_to :attachable, :polymorphic => true
	has_many :comments, :as => :commentable, :dependent => :destroy

	def creator
		User.find_by_id(self.created_by)
	end

end
