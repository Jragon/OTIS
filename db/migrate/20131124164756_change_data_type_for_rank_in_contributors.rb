class ChangeDataTypeForRankInContributors < ActiveRecord::Migration
  def up
    connection.execute(%q{
      alter table contributors
      alter column rank
      type integer using cast(rank as integer)
    })
  end
end
