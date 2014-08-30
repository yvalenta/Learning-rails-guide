# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'page:change', ->
  $('#departamento').change ->
    $.getJSON '/ciudades/search/1.json', (data) ->
      console.log data
