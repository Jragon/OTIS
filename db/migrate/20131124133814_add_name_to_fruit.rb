class AddNameToFruit < ActiveRecord::Migration
  def change
    add_column :fruits, :name, :string
  end
end
