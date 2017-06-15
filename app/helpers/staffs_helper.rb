module StaffsHelper
  def staff_options()
    Staff.all.pluck('id, last_name, first_name, birthday')
  end
end
