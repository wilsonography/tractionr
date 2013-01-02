# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
	$(".new-deliverable-modal").live "ajax:success", (evt, data, status, xhr) ->
		$('#new-deliverable-form .modal-body').html xhr.responseText
		$('#new-deliverable-form .datepicker').datepicker()
		$('#new-deliverable-form').modal "show"
		
	$("#new-deliverable-form").bind "ajax:success", (evt, data, status, xhr) ->		
		phase_id = $('#deliverable_phase_id').val()
		$('#dp-'+phase_id).append xhr.responseText
		$('#new-deliverable-form').modal "hide"
		$('.best_in_place').best_in_place()
		
	$(document).on "ajax:success", ".delete-deliverable", ->
  	   $(this).parent().slideUp()