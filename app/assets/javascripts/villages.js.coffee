# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#discussion_group_name').autocomplete
    source: $('#discussion_group_name').data('autocomplete-source')