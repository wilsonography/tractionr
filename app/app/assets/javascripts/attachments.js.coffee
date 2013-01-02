# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready -> 
	$('a.fancybox').fancybox 		
		'openEffect': 'elastic'
		'closeEffect'	:	'elastic'
		
  $("#new_attachment").bind "ajax:success", (evt, data, status, xhr) ->
    $form = undefined
    $form = $(this)
    $form.find("textarea,input[type=\"text\"],input[type=\"file\"]").val ""
    $("#attachments-list").append(xhr.responseText).slideDown()
    
  $(document).on "ajax:success", ".delete-attachment", ->
  	 $(this).parent().slideUp()
