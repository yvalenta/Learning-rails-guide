# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'page:change', ->
  $('#departamento').change ->
    departamento = $(@).val()
    target = $('#cliente_ciudad_id')
    target.find('option').remove()
    $.getJSON "/ciudades/search/#{departamento}.json", (data) ->
      for ciudad in data
        target.append("<option value='#{ciudad.id}'>#{ciudad.nombre}</option>")
        console.log "#{ciudad.nombre}: #{ciudad.id}"