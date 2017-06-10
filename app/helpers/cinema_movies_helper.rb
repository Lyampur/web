module CinemaMoviesHelper
  def link_to_add_cinema(form, movie)
    new_obj = Cinema.new()
    fld = form.fields_for(:cinema, new_obj,
      :child_index => 'new_cinema') do |df|
      render('movies/cinema_movie_fields', df: df, i: 'Новый')
    end
    link_to(?#, class: 'btn btn-info',
        id: 'add_cinema_link', data: {content: "#{fld}"}) do
      fa_icon("plus") + " Новый автор"
    end
  end
  def link_to_remove_cinema(form)
    form.hidden_field(:_destroy, class: 'remove_fields') +
        link_to(?#, class: 'remove_fields remove_cinema') do
      fa_icon('times', title: 'Удалить автора') + ' Удалить'
    end
  end
end
