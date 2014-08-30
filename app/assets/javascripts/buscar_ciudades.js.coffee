$.fn.buscar_ciudad = () ->



@buscar_ciudad = (source) ->
  departamento = source
  if departamento.val() != '' && departamento.val() != undefined
    target = $(departamento.attr('data-target'))
    target.find('option').remove()
    $.getJSON "/ciudades/search/#{departamento.val()}.json", (data) ->
      for ciudad in data
        target.append("<option value='#{ciudad.id}'>#{ciudad.nombre}</option>")
        console.log "#{ciudad.nombre}: #{ciudad.id}"

