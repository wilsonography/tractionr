# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
	$(".comments-modal").bind "ajax:success", (evt, data, status, xhr) ->
		$('#new-comment-form .modal-body').html xhr.responseText
		$('#new-comment-form').modal "show"
		
	$("#new-comment-form").bind "ajax:success", (evt, data, status, xhr) ->		
		$('#new-comment-form .modal-body').html xhr.responseText