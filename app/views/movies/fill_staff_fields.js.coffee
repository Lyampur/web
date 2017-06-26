ids = []
$('div.staff-id input').each( ->
  val = $(this).val()
  if !!val
    ids.push(+val) )

id = "<%= @staff.try(:id) %>"
uniqStaffOnPage = !ids.includes(+id)
timestamp = "<%= @timestamp %>"
staffRecieved = ("<%= @staff.nil? %>" == 'true')
movieStaffRecieved = ("<%= @movie_staff.nil? %>" == 'true')
selectorId = '#movie_movie_staffs_attributes_'
selectorAttributes = '_staff_attributes_'
# пришел запрос на уникального автора
if !staffRecieved && uniqStaffOnPage
  if !movieStaffRecieved
    role = "<%= @movie_staff.try(:role) %>"
  first_name = "<%= @staff.try(:first_name) %>"
  last_name = "<%= @staff.try(:last_name) %>"
  birthday = "<%= @staff.try(:birthday) %>"

# пришел запрос на пустого автора или неуникального автора
else
  # пришел запрос на неуникального автора
  if ! uniqStaffOnPage
    $(selectorId + timestamp + "_staff_id").val( 0 )
  role = ""
  id = ""
  first_name = ""
  last_name = ""
  birthday = ""
# меняем значение полей
$(selectorId + timestamp + '_'                + 'role').val( role )
$(selectorId + timestamp + selectorAttributes + 'id').val( id )
$(selectorId + timestamp + selectorAttributes + 'first_name').val( first_name )
$(selectorId + timestamp + selectorAttributes + 'last_name').val( last_name )
$(selectorId + timestamp + selectorAttributes + 'birthday').val( birthday )

# console.log("Удача! это сообщение - конечный приемник")
