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

Movie.delete_all; Staff.delete_all; Cinema.delete_all

c1 = Cinema.find_or_create_by(name: "Пионер", address: "Кутузовский просп., 21")
c2 = Cinema.find_or_create_by(name: "Иллюзион", address: "Котельническая наб., 1/15")
c3 = Cinema.find_or_create_by(name: "35ММ", address: "Покровка, 47/24")
c4 = Cinema.find_or_create_by(name: "Формула Кино", address: "Комсомольский просп., 21/10")
c5 = Cinema.find_or_create_by(name: "Звезда", address: "Земляной Вал, 18/22")
c6 = Cinema.find_or_create_by(name: "Каро", address: "Н.Арбат, 24")

s1 = Staff.find_or_create_by(last_name: "ДиКаприо", first_name: "Леонардо", birthday: "11/11/1974")
s2 = Staff.find_or_create_by(last_name: "Нолан", first_name: "Кристофер", birthday: "30/07/1970")
s3 = Staff.find_or_create_by(last_name: "Харди", first_name: "Том", birthday: "15/09/1977")
s4 = Staff.find_or_create_by(last_name: "Хэтэуэй", first_name: "Энн", birthday: "11/12/1982")
s5 = Staff.find_or_create_by(last_name: "Гослинг", first_name: "Райан", birthday: "12/11/1980")
s6 = Staff.find_or_create_by(last_name: "Стоун", first_name: "Эмма", birthday: "6/11/1988")
s7 = Staff.find_or_create_by(last_name: "Демьяненко", first_name: "Александр", birthday: "30/05/1937")
s8 = Staff.find_or_create_by(last_name: "Гайдай", first_name: "Леонид", birthday: "30/01/1923")
s9 = Staff.find_or_create_by(last_name: "Ришар", first_name: "Пьер", birthday: "16/08/1934")

m1 = Movie.find_or_create_by(name: "Начало", genre: "фантастика", duration: "148 мин.", country: "США", company: "Warner Bros.", age_rating: 12)
m2 = Movie.find_or_create_by(name: "Интерстеллар", genre: "фантастика", duration: "169 мин.", country: "США", company: "Warner Bros.", age_rating: 12)
m3 = Movie.find_or_create_by(name: "Выживший", genre: "триллер", duration: "156 мин.", country: "США", company: "20th Century Fox", age_rating: 18)
m4 = Movie.find_or_create_by(name: "Ла-Ла Ленд", genre: "мюзикл", duration: "128 мин.", country: "США", company: "Summit Entertainment", age_rating: 16)
m5 = Movie.find_or_create_by(name: "Операция «Ы» и другие приключения Шурика", genre: "мелодрама", duration: "95 мин.", country: "СССР", company: "Мосфильм", age_rating: 0)
m6 = Movie.find_or_create_by(name: "Рассеянный", genre: "комедия", duration: "85 мин.", country: "Франция", company: "Gaumont", age_rating: 0)

# добавляем связи
MovieStaff.create(movie_id: m1.id,  staff_id: s1.id, role: 'актер')
MovieStaff.create(movie_id: m1.id,  staff_id: s2.id, role: 'режиссер')

MovieStaff.create(movie_id: m2.id,  staff_id: s4.id, role: 'актер')
MovieStaff.create(movie_id: m2.id,  staff_id: s2.id, role: 'режиссер')

MovieStaff.create(movie_id: m3.id,  staff_id: s1.id, role: 'актер')
MovieStaff.create(movie_id: m3.id,  staff_id: s2.id, role: 'режиссер')
MovieStaff.create(movie_id: m3.id,  staff_id: s3.id, role: 'актер')

MovieStaff.create(movie_id: m4.id,  staff_id: s5.id, role: 'актер')
MovieStaff.create(movie_id: m4.id,  staff_id: s6.id, role: 'актер')

MovieStaff.create(movie_id: m5.id,  staff_id: s7.id, role: 'актер')
MovieStaff.create(movie_id: m5.id,  staff_id: s8.id, role: 'режиссер')

MovieStaff.create(movie_id: m6.id,  staff_id: s9.id, role: 'актер')
MovieStaff.create(movie_id: m6.id,  staff_id: s9.id, role: 'режиссер')

c1.movies << Movie.all
c2.movies << m1 << m2 << m3 << m4
c3.movies << m3 << m4 << m5
c4.movies << m5 << m6
c5.movies << m1 << m2 << m3
c6.movies << m4 << m5
# Movie.first.staffs << Staff.first
# Movie.first.staffs << Staff.second
#
# Movie.second.staffs << Staff.second
#
# Cinema.first.movies << Movie.first
# Cinema.first.movies << Movie.second
#
# Cinema.second.movies << Movie.first
