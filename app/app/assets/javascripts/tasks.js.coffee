# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
	$(document).on "ajax:success", ".task-form form", (evt, data, status, xhr) ->
		$(this).find('.textarea').val ' '
		$(this).find('#task_budget').val ' '
		$(this).parent().prev('.task-list').append xhr.responseText
		$('.best_in_place').best_in_place()
				
	$('.task-form-hide').on "click", ->
		$(this).parent().parent().next('.add-task-box').show()
		$(this).parent().parent().hide()
	
	$('.add-task').on "click", ->
		$(this).parent().prev('.task-form').show()
		$(this).parent().hide()
		
	$(document).on "ajax:success", ".delete-task", ->
  	   $(this).parent().slideUp()
  	   
  	$('.checkable').live 'change', ->
	    $(this).parent().submit()
	    return false