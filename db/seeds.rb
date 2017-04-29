if (u1 = User.find_by_email('admin@localhost')).nil?
  u1 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'admin@localhost')
  u1.activate!
end
if (u2 = User.find_by_email('user@localhost')).nil?
  u2 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'user@localhost')
  u2.activate!
end
r1, r2 = Role.create_main_roles
ru1 = RoleUser.create(role: r1, user: u1)
ru2 = RoleUser.create(role: r2, user: u2)

Cinema.create(name: "Пионер", address: "Кутузовский просп., 21")
Cinema.create(name: "Иллюзион", address: "Котельническая наб., 1/15")

Staff.create(last_name: "ДиКаприо", first_name: "Леонардо", birthday: "11/11/1974")
Staff.create(last_name: "Харди", first_name: "Том", birthday: "09/15/1977")
Staff.create(last_name: "Хэтэуэй", first_name: "Энн", birthday: "11/12/1982")
Staff.create(last_name: "Нолан", first_name: "Кристофер", birthday: "07/30/1970")

Movie.create(name: "Начало", genre: "фантастика, боевик", duration: "148 мин.", country: "США, Великобритания", company: "Warner Bros.", age_rating: 12)
Movie.create(name: "Интерстеллар", genre: "фантастика, драма", duration: "169 мин.", country: "США, Великобритания", company: "Warner Bros.", age_rating: 12)
Movie.create(name: "Выживший", genre: "триллер, драма", duration: "156 мин.", country: "США, Гонконг", company: "20th Century Fox", age_rating: 18)

Movie.first.staffs << Staff.first
Movie.first.staffs << Staff.second
Movie.first.staffs << Staff.fourth

Movie.second.staffs << Staff.third
Movie.second.staffs << Staff.fourth

Movie.third.staffs << Staff.first
Movie.third.staffs << Staff.second

Cinema.first.movies << Movie.first
Cinema.first.movies << Movie.second

Cinema.second.movies << Movie.first
Cinema.second.movies << Movie.third
