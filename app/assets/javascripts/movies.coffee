fillFields = ->
  allDropdownLists = $('select[id$=staff_id]')
  allDropdownLists.off('change')
  allDropdownLists.on 'change', (e) ->
    # console.log('сработал эвент измены выпадающего ')
    # console.log('выведем this')
    # console.log( $(this).find('option:selected').val() )
    selectedStaff = $(this).find('option:selected').val()
    name = $(this).attr('name').match(/attributes]\[(\d+)\]/)
    timestamp = name[name.length - 1]
    # console.log("попытка послать ajax")
    $.ajax
      url: '/fill_staff_fields'
      type: 'POST'
      dataType: 'script'
      data: { staff_id: selectedStaff, timestamp: timestamp }
      # error: (jqXHR, textStatus, errorThrown) ->
      #   console.log("AJAX error: #{textStatus}")
      # success: (data, textStatus, jqXHR) ->
      #   console.log("AJAX OK!")


@delete_one_stf = (link)->
  if confirm("Вы уверены?")
    link.parent().find("input[type=hidden].remove_fields").first().val("1")
    link.parent().parent().parent().parent().remove()
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
    fillFields()

ru_ready = ->
  window.add_new_staff_ru()
  window.del_all_stfs()
  fillFields()
$(document).on 'page:load', ru_ready
$(document).ready ru_ready



# ru_ready = ->
#   fillFields()
#   $('#wrapper_for_authors').on 'cocoon:after-insert', ->
#     $('select[id$=author_id]').off('change')
#     # cocoonCallback()
#     fillFields()


# $(document).on 'turbolinks:load', ru_ready
# $(document).ready ru_ready
