class RemoveTenSeedFromContributors < ActiveRecord::Migration
  def change
    remove_column :contributors, :ten_seed, :integer
  end
end
