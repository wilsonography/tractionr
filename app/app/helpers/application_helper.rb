module ApplicationHelper

	def account_users
		@users = User.find_all_by_account_id(current_user.account_id)
		return @users
	end
	
	def users_for_inline_select
		@users = User.find_all_by_account_id(current_user.account_id)

		options = @users.select().map {|x| [x.id, x.name] }

		return options
	end

end
