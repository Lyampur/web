@add_new_ru = ->
  $('#add_role_link').on 'click', ->
    new_id = new Date().getTime()
    regexp = new RegExp("new_role", "g")
    content = $(this).attr('data-content')
    content = content.replace(regexp, new_id)
    $(this).parent().parent().after(content)
    false
 false
ru_ready = ->
  window.add_new_ru()
$(document).ready ru_ready
$(document).on 'page:load', ru_ready
