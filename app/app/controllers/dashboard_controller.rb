class DashboardController < ApplicationController
helper LaterDude::CalendarHelper
	def index
		
		@team = User.find_all_by_account_id_and_role(current_user.account_id, 'teamster')
		
		@projects = Project.find_all_by_active_and_account_id(1, current_user.account_id)
		
		render :layout => 'dashboard'
				
	end

end
