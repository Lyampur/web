module RoleUsersHelper
  def link_to_add_role(f, object)
    new_object = RoleUser.new
    fields = f.fields_for(:role_users, new_object,
      child_index: 'new_role') do |fr|
        render('users/one_role_user_form', fr: fr, i: 'Новая')
      end
    link_to('#', class: 'btn btn-info',
    id: :add_role_link, data: {content: "#{fields}"}) do
      fa_icon("plus") + " Новая роль"
    end
  end
end
