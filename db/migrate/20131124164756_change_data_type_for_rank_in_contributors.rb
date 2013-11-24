class ChangeDataTypeForRankInContributors < ActiveRecord::Migration
  def up
    connection.execute(%q{
      alter table contributors
      alter column rank
      type integer using cast(number as integer)
    })
  end
end
