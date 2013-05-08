class Home
  @document_ready: ->
    $('#form').on('click', 'a[data-clear-form]', Home.clear_form)
    $('#delete-photos').on('click', 'a[data-delete-photos]', Home.delete_photos)
    photos = $('.photo').length
    $('#slider').slider({ min: 0, max: photos, step: 1, slide: Home.sliding })
    $('#slider').slider('option', 'value', photos) #this moves the scroll al the way to the end

  @clear_form: (e) ->
    e.preventDefault()
    $('#form').empty()

  @sliding: (e, ui) ->
    album_id = $('#album').data('album-id')
    # console.log(ui.value)
    # console.log(album_id)
    count = ui.value #position teh slider is at
    settings =
      dataType: 'script' #sending JS back, not JSON
      type: 'get'
      url: "/albums/#{album_id}/filter?count=#{count}"
    # console.log(settings.url)
    $.ajax(settings)

  @delete_photos: (e) ->
    alert "under construction - can't yet delete the lovely kitties"
    # e.preventDefault()
    # $("input:checked").each ->
    #   arr += $(this).val()
    # console.log arr



$(document).ready(Home.document_ready) #document.ready is a class function
