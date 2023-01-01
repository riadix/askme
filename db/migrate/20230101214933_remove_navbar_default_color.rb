class RemoveNavbarDefaultColor < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:users, :navbar_color, :nil)
  end
end
