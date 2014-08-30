# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'page:change', ->
  $('#empresa_departamento_id').change ->
    buscar_ciudad($(@))
  buscar_ciudad($('#empresa_departamento_id'))