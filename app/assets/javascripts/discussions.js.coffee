# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('.best_in_place').best_in_place()

  $('.conversation_change_name').autocomplete
    source: $('#conversation_change_name').data('autocomplete-source');

  $("span[data-autocomplete='true']").click ->
    $('.conversation_change_name').autocomplete
      source: $('#conversation_change_name').data('autocomplete-source');

  $('#conversations').sortable(
    handle: '.handle'
    axis: 'y'
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))
  );
  $('.best_in_place').best_in_place()