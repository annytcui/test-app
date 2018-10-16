module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Panda Visas"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  # Returns the full name of a user.
  def full_name(user)
    "#{user.firstname} #{user.lastname}"
  end
end
