class AddFruitIdToThreats < ActiveRecord::Migration
  def change
    add_column :threats, :fruit_id, :integer
  end
end
