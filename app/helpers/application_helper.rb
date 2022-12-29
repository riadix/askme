module ApplicationHelper

  def inclination(count, one, many)
    if count == 1
      one
    else
      many
    end
  end

end
