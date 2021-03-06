module Admin::UsersHelper
  def after_password_input(user)
    if user.id
      "Reset #{check_box_tag('reset_password')}"
    end
  end
  
  def password_html_for_form(user)
    if !user.id
      "(autogenerated)"
    end
  end
end
