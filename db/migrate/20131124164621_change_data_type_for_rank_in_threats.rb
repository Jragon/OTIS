class ChangeDataTypeForRankInThreats < ActiveRecord::Migration
  def change
    change_table :threats do |t|
      t.change :rank, :integer
    end
  end
end
