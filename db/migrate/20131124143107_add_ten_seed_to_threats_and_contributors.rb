class AddTenSeedToThreatsAndContributors < ActiveRecord::Migration
  def change
    add_column :threats, :ten_seed, :integer
    add_column :contributors, :ten_seed, :integer
  end
end
