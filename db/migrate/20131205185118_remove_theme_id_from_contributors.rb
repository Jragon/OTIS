class RemoveThemeIdFromContributors < ActiveRecord::Migration
  def change
    remove_column :contributors, :theme_id, :integer
  end
end
