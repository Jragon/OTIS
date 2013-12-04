class AddColumnThemeIdToFruits < ActiveRecord::Migration
  def change
    add_column :fruits, :theme_id, :string
  end
end
