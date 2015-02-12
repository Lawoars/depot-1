# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "ready", ->
    $('.col-md-2').click ->
        $(this).parent().find(':submit').click()