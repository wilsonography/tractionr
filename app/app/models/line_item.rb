class LineItem < ActiveRecord::Base

	belongs_to :invoice
	has_many :comments, :as => :commentable
	
end
