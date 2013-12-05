class RemoveThreatIdFromThreats < ActiveRecord::Migration
  def change
    remove_column :threats, :threat_id, :integer
  end
end
