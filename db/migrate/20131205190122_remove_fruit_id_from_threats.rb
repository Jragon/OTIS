class RemoveFruitIdFromThreats < ActiveRecord::Migration
  def change
    remove_column :threats, :fruit_id, :integer
  end
end
