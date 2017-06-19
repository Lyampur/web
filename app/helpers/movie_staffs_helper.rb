module MovieStaffsHelper
  def link_to_add_staff(form, movie)
    new_obj = MovieStaff.new()
    fld = form.fields_for(:movie_staffs, new_obj,
      :child_index => 'new_staff') do |df|
        render('movies/staff_movie_form', df: df, i: 'Новый')
    end
    link_to(?#, class: 'btn btn-info',
    id: 'add_staff_link', data: {content: "#{fld}"}, remote: true)  do
      fa_icon("plus") + " Новый сотрудник"
    end
  end

  def link_to_remove_staff(form)
    form.hidden_field(:_destroy, class: 'remove_fields') +
        link_to(?#, class: 'remove_fields remove_staff') do
      fa_icon('times', title: 'Удалить сотрудника') + ' Удалить'
    end
  end
end
