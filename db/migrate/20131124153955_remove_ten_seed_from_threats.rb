class RemoveTenSeedFromThreats < ActiveRecord::Migration
  def change
    remove_column :threats, :ten_seed, :integer
  end
end
