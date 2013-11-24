class ChangeDataTypeForRankInContributors < ActiveRecord::Migration
  def change
    change_column :contributors, :rank, 'integer USING CAST(rank AS integer)'
  end
end
