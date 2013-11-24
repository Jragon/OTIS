class ChangeDataTypeForRankInContributors < ActiveRecord::Migration
  def change
    change_table :contributors do |t|
      t.change :rank, :integer
    end
  end
end
