class RemoveThreatIdFromContributors < ActiveRecord::Migration
  def change
    remove_column :contributors, :threat_id, :integer
  end
end
