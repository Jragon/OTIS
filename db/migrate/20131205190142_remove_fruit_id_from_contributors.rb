class RemoveFruitIdFromContributors < ActiveRecord::Migration
  def change
    remove_column :contributors, :fruit_id, :integer
  end
end
