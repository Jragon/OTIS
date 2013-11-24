class AddFruitIdToContributors < ActiveRecord::Migration
  def change
    add_column :contributors, :fruit_id, :integer
  end
end
