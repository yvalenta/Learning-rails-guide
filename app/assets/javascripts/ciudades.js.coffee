# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

buscar_ciudad = () ->
  departamento = $('#cliente_departamento_id').val()
  target = $('#cliente_ciudad_id')
  target.find('option').remove()
  $.getJSON "/ciudades/search/#{departamento}.json", (data) ->
    for ciudad in data
      target.append("<option value='#{ciudad.id}'>#{ciudad.nombre}</option>")
  #console.log "#{ciudad.nombre}: #{ciudad.id}"

$(document).on 'page:change', ->
  $('#cliente_departamento_id').change ->
    departamento = $(@).val()
    target = $('#cliente_ciudad_id')
    target.find('option').remove()
    $.getJSON "/ciudades/search/#{departamento}.json", (data) ->
      for ciudad in data
        target.append("<option value='#{ciudad.id}'>#{ciudad.nombre}</option>")
        #console.log "#{ciudad.nombre}: #{ciudad.id}"

$(document).on 'page:change', ->
  $('#cliente_departamento_id').change ->
    buscar_ciudad()
  buscar_ciudad()