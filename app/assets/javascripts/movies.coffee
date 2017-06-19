@delete_one_stf = (link)->
  if confirm("Вы уверены?")
    link.parent().find("input[type=hidden].remove_fields").first().val("1")
    link.parent().parent().parent().parent().hide()
@del_all_stfs = ->
  $('a.remove_staff').on 'click', ->
    window.delete_one_stf($(this))
    false
  false
@add_new_staff_ru = ->
  $('#add_staff_link').on 'click', ->
    new_id = new Date().getTime()
    regexp = new RegExp("new_staff", "g")
    content = $(this).attr('data-content')
    content = content.replace(regexp, new_id)
    $(this).parent().parent().after(content)
    panel = $(this).parent().parent().parent().find('.panel-info').first()
    window.datepicker_activation_by_item(panel)
    panel.find('a.remove_staff').on 'click', ->
      window.delete_one_stf($(this))
      false
    false
ru_ready = ->
  window.add_new_staff_ru()
  window.del_all_stfs()
$(document).on 'page:load', ru_ready
$(document).ready ru_ready
