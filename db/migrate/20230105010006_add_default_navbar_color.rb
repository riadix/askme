class AddDefaultNavbarColor < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:users, :navbar_color, '#370617')
  end
end
