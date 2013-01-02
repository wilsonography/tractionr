# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
	$(".new-phase-modal").bind "ajax:success", (evt, data, status, xhr) ->
		$('#new-phase-form .modal-body').html xhr.responseText
		$('#new-phase-form').modal "show"
		
	$("#new-phase-form").bind "ajax:success", (evt, data, status, xhr) ->		
		$('#phase-list').append xhr.responseText
		$('#new-phase-form').modal "hide"
		$('.best_in_place').best_in_place()
	
	$(".new-deliverable-modal").bind "ajax:success", (evt, data, status, xhr) ->
			$('#new-deliverable-form .modal-body').html xhr.responseText
			$('#new-deliverable-form').modal "show"
		
	$(document).on "ajax:success", ".delete-phase", ->
  	   $(this).parent().slideUp()