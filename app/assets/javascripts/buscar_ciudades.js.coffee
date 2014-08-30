$.fn.buscar_ciudad = () ->
  departamento = @val()
  if departamento != '' && departamento != undefined
    target = $(@attr 'data-target')
    target.find('option').remove()
    $.getJSON "/ciudades/search/#{departamento}.json", (data) ->
      for ciudad in data
        target.append("<option value='#{ciudad.id}'>#{ciudad.nombre}</option>")
        console.log "#{ciudad.nombre}: #{ciudad.id}"

