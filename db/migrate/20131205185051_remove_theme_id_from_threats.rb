class RemoveThemeIdFromThreats < ActiveRecord::Migration
  def change
    remove_column :threats, :theme_id, :integer
  end
end
