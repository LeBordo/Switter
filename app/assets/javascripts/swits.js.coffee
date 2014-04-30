# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
hide_comment_link = () ->
  $('#add_comment_link').hide()
hide_comment = () ->
  $('#add_comment').hide()
show_comment = () ->
  $('#add_comment').show()

$('#add_comment_link').click ->
  hide_comment_link()
  show_comment()
  false