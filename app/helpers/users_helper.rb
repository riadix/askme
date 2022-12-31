module UsersHelper

  def display_nickname(user)
    "@#{user.nickname}"
  end

  def color(user)
    "##{user.navbar_color}"
  end

end
