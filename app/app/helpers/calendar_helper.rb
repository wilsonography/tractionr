module CalendarHelper

	def availability_calendar
# 	Get tasks and due dates
	  @tasks = Task.find_all_by_account_id(current_user.account_id)
	  
	  due_dates = []
	  @tasks.each do |t|
	  	due_dates << t.due_date
	  end	
	  
	  lambda do |day|
	    if due_dates.include? day
			return build_day(day,@tasks), :class => 'due-date'
	    else
	      day.day
	    end
	  end
	end
	
	def priority_calendar
# 	Get tasks and due dates
	  @tasks = Task.find_all_by_account_id(current_user.account_id)
	  
	  priority_dates = build_priorities()
	  due_dates = []
	  @tasks.each do |t|
	  	due_dates << t.due_date
	  end	
	  
	  lambda do |day|
	    if due_dates.include?(day) && priority_dates.include?(day)
	    	return build_priority_due_date(day,priority_dates), :class => 'due-date priority-day'
	    elsif due_dates.include? day
			return build_due_date(day, @tasks), :class => 'due-date disabled' if day < Date.today
			return build_due_date(day, @tasks), :class => 'due-date' if day > Date.today
		 elsif priority_dates.include? day
			return build_priority_due_date(day,priority_dates), :class => 'priority-day'
	    elsif day > Date.today
	      return day.day
	    elsif day < Date.today
	      return day.day, :class => 'disabled'
	    end
	  end
	end
		
	def build_priorities()
		priority_day = Date.today
		priority_dates = {}
		used_time = 0
		day_count = 0
		tbudget = 0
		
		@tasks = Task.find_all_by_account_id_and_completed(current_user.account_id, nil).sort_by{|a| [a.priority, a.due_date]}

		@tasks.each do |t| 
			tbudget += t.budget 
		end		

		day_count = (tbudget.to_f / 7.to_f).ceil
		
		while day_count > 0
			priority_dates[priority_day] = []
			priority_day += 1
			priority_day.cwday == 7 ? priority_day += 1 : ''
			priority_day.cwday == 6 ? priority_day += 2 : ''
			day_count -= 1
		end
		
		priority_dates.each_key do |p|
			used_time = 0
			total_day_time = 7
			@tasks.each do |t|
				
				t.calendar_time = 0 if t.calendar_time.nil?
				t.day_span = 0 if t.day_span.nil?
				t.time_scheduled = 0 if t.time_scheduled.nil?
				
	# 			How many days will this task span in the calendar?
	#			t.day_span = (t.budget.to_f / 7.to_f).ceil if t.day_span.nil?
				
	# 			If it still has any days left to span, do this, otherwise we're done here
				if used_time < total_day_time && t.budget > t.time_scheduled

# 					t.calendar_time = total_day_time if used_time == 0 && (t.budget - t.time_scheduled) > total_day_time
# 					t.calendar_time = t.budget if (total_day_time - used_time) >= t.budget && t.time_scheduled == 0
# 					t.calendar_time = (t.budget - t.time_scheduled) if (t.budget - t.time_scheduled) <= (total_day_time - used_time)
# 					t.calendar_time = (total_day_time - used_time) if (t.budget - t.time_scheduled) > (total_day_time - used_time)
				
					total_used_diff = total_day_time - used_time
					budget_sched_diff = t.budget - t.time_scheduled
					t.calendar_time = [budget_sched_diff, total_used_diff].min
					
					t.day_span += 1
					used_time += t.calendar_time					
					t.time_scheduled += t.calendar_time		
									
# 					priority_dates[p] << {'Day Span' => t.day_span}
# 					priority_dates[p] << {'Calendar Time' => t.calendar_time}	
# 					priority_dates[p] << {'Time Scheduled' => t.time_scheduled}

					task = Task.find(t)
					task.calendar_time = t.calendar_time
		
					priority_dates[p] << task									
				end	
			end
# 			priority_dates[p] << {'Day Time' => used_time}
		end	

		return priority_dates
	end
	
	def build_priority_due_date(day, tasks)
# 		Get the tasks for just this day
		todays_tasks = []
		tasks.each_key do |p|
			if p == day
				tasks[p].each do |t|
					todays_tasks << t
				end
			end
		end
		

		#return debug(todays_tasks)
		tasks_for_day(day, todays_tasks, true)
	end

	def build_due_date(day, tasks)
# 		Get the tasks for just this day
		todays_tasks = []
		tasks.each do |t|
			t.due_date == day ? todays_tasks << t : ''
		end

		tasks_for_day(day, todays_tasks, false)
	end

	
	def tasks_for_day(day, tasks, priority)
		
		output = ''
		output += '<span class="day-num">'+day.day.to_s+'</span>'
    	tasks.each do |t|
    	  link_class = ''
    	  priority == true ? link_class = 'priority' : link_class = 'due-date-link'
    	  link_style = "height: #{((t.calendar_time.to_f * 1.43) / 100.to_f).round(2) * 1000}%" if priority == true
    	  link_class += " priority-#{t.priority_name.downcase}" if link_class == 'priority'
    	  link_class += " disabled" if day < Date.today
    	  
	     output += link_to("#{ t.due_date == day ? 'Due: '+t.description.truncate(25) : t.description.truncate(25)}", "#", :rel => 'popover', 'data-content' => "#{t.description}", 'data-original-title' => "Priority: #{t.priority_name}", 'style' => link_style, :class => link_class)
      end
      return output
	end
		
end